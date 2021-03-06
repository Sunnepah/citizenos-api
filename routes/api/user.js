'use strict';

module.exports = function (app) {
    var loginCheck = app.get('middleware.loginCheck');
    var cosActivities = app.get('cosActivities');
    var db = app.get('db');

    var User = app.get('models.User');
    var UserConsent = app.get('models.UserConsent');

    /**
     * Update User info
     */
    app.put('/api/users/:userId', loginCheck(['partner']), function (req, res, next) {

        var fields = ['name', 'company', 'email', 'language', 'imageUrl'];
        if (!req.user.partnerId) { // Allow only our own app change the password
            fields.push('password');
        }

        User
            .update(
                req.body,
                {
                    where: {
                        id: req.user.id
                    },
                    fields: fields,
                    limit: 1,
                    returning: true
                }
            )
            .then(function (results) {
                // Results array where 1-st element is number of rows modified and 2-nd is array of modified rows
                return res.ok(results[1][0].toJSON());
            })
            .catch(next);
    });

    /**
     * Get User info
     *
     * Right now only supports getting info for logged in User
     */
    app.get('/api/users/:userId', loginCheck(['partner']), function (req, res, next) {
        User
            .findOne({
                where: {
                    id: req.user.id
                }
            })
            .then(function (user) {
                if (!user) {
                    return res.notFound();
                }

                return res.ok(user.toJSON());
            })
            .catch(next);
    });

    /**
     * Create UserConsent
     */
    app.post('/api/users/:userId/consents', loginCheck(), function (req, res, next) {
        var userId = req.user.id;
        var partnerId = req.body.partnerId;

        db
            .transaction(function (t) {
                return UserConsent
                    .upsert({
                        userId: userId,
                        partnerId: partnerId
                    }, {
                        transaction: t
                    })
                    .then(function (created) {
                        if (created) {
                            var userConsent = UserConsent.build({
                                userId: userId,
                                partnerId: partnerId
                            });

                            return cosActivities
                                .createActivity(userConsent, null, {
                                    type: 'User',
                                    id: userId
                                }, req.method + ' ' + req.path, t);
                        }

                        return created;
                    });
            })
            .then(function () {
                return res.ok();
            })
            .catch(next);
    });

    /**
     * Read User consents
     */
    app.get('/api/users/:userId/consents', loginCheck(), function (req, res, next) {
        var userId = req.user.id;

        db
            .query(
                '\
                SELECT \
                    p.id, \
                    p.website, \
                    p."createdAt", \
                    p."updatedAt" \
                FROM "UserConsents" uc \
                LEFT JOIN "Partners" p ON (p.id = uc."partnerId") \
                WHERE uc."userId" = :userId \
                  AND uc."deletedAt" IS NULL \
                ;',
                {
                    replacements: {
                        userId: userId
                    },
                    type: db.QueryTypes.SELECT,
                    raw: true,
                    nest: true
                }
            )
            .then(function (results) {
                return res.ok({
                    count: results.length,
                    rows: results
                });
            })
            .catch(next);
    });

    /**
     * Delete User consent
     */
    app.delete('/api/users/:userId/consents/:partnerId', loginCheck(), function (req, res, next) {
        var userId = req.user.id;
        var partnerId = req.params.partnerId;

        db
            .transaction(function (t) {
                return UserConsent
                    .destroy(
                        {
                            where: {
                                userId: userId,
                                partnerId: partnerId
                            },
                            limit: 1,
                            force: true
                        },
                        {
                            transaction: t
                        }
                    )
                    .then(function () {
                        var consent = UserConsent.build({
                            userId: userId,
                            partnerId: partnerId
                        });

                        return cosActivities
                            .deleteActivity(
                                consent,
                                null,
                                {
                                    type: 'User',
                                    id: req.user.id
                                },
                                req.method + ' ' + req.path,
                                t
                            );
                    });
            })
            .then(function () {
                return res.ok();
            })
            .catch(next);
    });

};
