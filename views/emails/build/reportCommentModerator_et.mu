<tbody>
    <tr>
        <td align="center" height="70" style="border-collapse: collapse" valign="middle">
            <!--p style="font-family: arial, helvetica, sans-serif;font-size:12px;background-color: #f6f6f6; color:#828282;">Can't see this mail? <a href="#" target="_blank" style=" color:#828282; text-decoration:underline;font-family: arial, helvetica, sans-serif;font-size:12px;">Click here to view it in your browser</a></p-->
        </td>
    </tr>

    <tr>
        <td align="center" valign="top" >
            <table border="0" cellpadding="0" cellspacing="0" id="templateContainer" style="background-color: #FFFFFF;margin: 0;padding: 0;" width="600">
                <tbody>
                    <tr>
                        <td align="center" valign="middle" style="background-color: #252525; border-bottom: 1px solid #e1e1e1; " height="100">
                            <img width="237" height="43" src="cid:logo" alt="logo" style="display:block;"  border="0"/>
                        </td>
                    </tr>

                    <tr>
                        <td align="center" valign="top">
                            <table border="0" cellpadding="25" cellspacing="0" id="templateBody" width="600" style="background-color: #FFFFFF;margin: 0;padding: 0;">
                                <tbody>
                                    <tr>
                                        <td class="bodyContent" style="background-color: #FFFFFF;" valign="top">
                                            <table border="0" cellpadding="10" cellspacing="0" width="100%">
                                                <tbody>


                                                    <tr>
                                                        <td  align="center" valign="middle" style="background-color: #FFFFFF;border-bottom: 1px solid #f0f0f0;" height="80">
                                                            <p style="font-family: georgia, serif;font-size:19px; font-weight:bold;background-color: #FFFFFF; color:#252525;">Kasutajad on teavitanud ebasobivast kommentaarist</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td  align="center" valign="middle" style="background-color: #FFFFFF;border-bottom: 1px solid #f0f0f0;" height="80">
                                                            <p style="font-family: georgia, serif;font-size:17px; font-weight:bold;background-color: #FFFFFF; color:#252525;">Kasutaja kirjutas:</p>
                                                            {{#comment.subject}}
<p style="font-family: georgia, serif;font-size:17px; font-weight:bold;background-color: #FFFFFF; color:#707070; font-style: italic">"{{comment.subject}}"</p>
{{/comment.subject}}
                                                            <p style="font-family: georgia, serif;font-size:17px; font-weight:bold;background-color: #FFFFFF; color:#707070; font-style: italic">"{{comment.text}}"</p>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td  align="center" valign="middle" style="background-color: #FFFFFF;border-bottom: 1px solid #f0f0f0;" height="80">
                                                            <p style="font-family: georgia, serif;font-size:17px; font-weight:bold;background-color: #FFFFFF; color:#252525;">Ebasobivuse põhjus keskkonna kasutaja arvates:</p>
                                                            <p style="font-family: georgia, serif;font-size:17px; font-weight:bold;background-color: #FFFFFF; color:#252525; font-style: italic">{{report.type}}</p>
                                                            {{#report.text}}
<p style="font-family: georgia, serif;font-size:17px; font-weight:bold;background-color: #FFFFFF; color:#707070; font-style: italic">"{{report.text}}"</p>
{{/report.text}}
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td  align="center" valign="middle" style="background-color: #FFFFFF;border-bottom: 1px solid #f0f0f0;" height="80">
                                                            <p style="font-family: georgia, serif;font-size:17px; font-weight:bold;background-color: #FFFFFF; color:#252525;">Sa võid:</p>
                                                            <ul>
                                                                <li style="font-family: georgia, serif;font-size:17px; font-weight: bold; font-style: italic ;background-color: #FFFFFF; color:#0680fc; margin-bottom: 17px;"><a href="{{linkModerate}}">Modereerida kommentaari</a> - {{#isUserNotified}}Kommentaari loojat on teavitatud{{/isUserNotified}}{{^isUserNotified}}Kommentaari loojat EI ole teavitatud{{/isUserNotified}}</li>
                                                                <li style="font-family: georgia, serif;font-size:17px; font-weight: bold; background-color: #FFFFFF; color:#252525; margin-bottom: 17px;">Jätta nii nagu on, aga moderaatorid võivad selle sisu siiski muuta vaikimisi mitte nähtavaks.</li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>

                </tbody>
            </table>
        </td>
    </tr>

    <tr>
        <td align="center" valign="top"  height="70">
            <table border="0" cellpadding="0" cellspacing="0" id="templateFooter" style="background-color: #f6f6f6;margin: 0;padding: 0;" width="600">
                <tbody>
                    <tr>
                        <td align="center" height="70" style="border-collapse: collapse" valign="middle">
                            <p style="font-family: arial, helvetica, sans-serif;font-size:12px;background-color: #f6f6f6; color:#828282;">Uuri lähemalt <a href="{{linkToApplication}}" target="_blank" style=" color:#828282; text-decoration:underline;">{{linkToApplication}}</a></p>
                        </td>
                    </tr>
                </tbody>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" valign="top"  height="100%">
            <br />
        </td>
    </tr>

</tbody>