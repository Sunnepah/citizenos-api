'use strict';

/**
 * Moderator
 *
 * @param {object} sequelize Sequelize instance
 * @param {object} DataTypes Sequelize DataTypes
 *
 * @returns {object} Sequelize model
 *
 * @see http://sequelizejs.com/docs/latest/models
 */
module.exports = function (sequelize, DataTypes) {

    var Moderator = sequelize.define(
        'Moderator',
        {
            userId: {
                type: DataTypes.UUID,
                allowNull: false,
                comment: 'Id of the User of the Moderator',
                references: {
                    model: 'Users',
                    key: 'id'
                },
                primaryKey: true
            },
            partnerId: {
                type: DataTypes.UUID,
                allowNull: false,
                comment: 'Which Partner moderator represents. One User can be a moderator of many Partners',
                references: {
                    model: 'Partners',
                    key: 'id'
                },
                primaryKey: true
            }
        }
    );

    return Moderator;
};
