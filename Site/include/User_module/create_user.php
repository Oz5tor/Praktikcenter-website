head>
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <script src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
    <script>
        $(function () {
            $("#datepicker").datepicker();
        });
    </script>

</head>
<form action="#" method="get">
    <table>
        <tr>
            <td>Fornavn: </td>
            <td>
                <input type="text" min="2" max="40" id="fName" required>
            </td>
        </tr>
        <tr>
            <td>Efternavn: </td>
            <td>
                <input type="text" min="2" max="50" id="lName" required>
            </td>
        </tr>
        <tr>
            <td>F&oslash;selsdag: </td>
            <td>
                <input type="text" id="datepicker" required>
            </td>
        </tr>
        <tr>
            <td>Udannelses: </td>
            <td>
                <select required>
                    <option selected value="">V&aelig;lg Udannelse</option>
                    <option value="1">Datateknikker specalisering i programmering</option>
                    <option value="1">Datateknikker specalisering i infrastruktur</option>
                    <option value="1">It-Supporter</option>
                </select>
            </td>
        </tr>
        <tr>
            <td>Addresse: </td>
            <td>
                <input type="text" id="address" max="100" required>
            </td>
        </tr>
        <tr>
            <td>Email: </td>
            <td>
                <input type="email" id="email" max="35" required>
            </td>
        </tr>
        <tr>
            <td>Telefon: </td>
            <td>
                <input type="tel" id="phone" min="8" max="8" pattern="[0-9]{8}" required>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <input type="submit" id="create_user" value="Opret bruger">
            </td>
        </tr>
    </table>
</form>
<?php echo '<pre>'; print_r($_POST); echo '</pre>'; ?>