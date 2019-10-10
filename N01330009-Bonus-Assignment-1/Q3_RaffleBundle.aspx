<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Q3_RaffleBundle.aspx.cs" Inherits="N01330009_Bonus_Assignment_1.Q3_RaffleBundle" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* 
            Date: 8th Oct 2019
            Resources: https://fonts.google.com/?selection.family=Merriweather+Sans 
            Google Fonts - Custom fonts Library
        */
        @import url('https://fonts.googleapis.com/css?family=Merriweather+Sans&display=swap');

        * {
            font-family: 'Merriweather Sans', sans-serif;
            box-sizing: border-box;
        }
        .raffle-bundle-container {
            margin: 0 auto;
            width: 70%;
            border: 1px solid #cfd8dc;
        }
        .raffle-bundle-container label, .raffle-bundle-container section, .raffle-bundle-container #raffle_bundle_output_container {
            margin-left: 10px;
        }
        .title-text {
            margin-top: 0;
            background-color: black;
            padding: 10px;
            color: white;
        }
        input {
            border: 0px;
            padding: 10px;
            border-bottom: 1px solid lightgrey;
        }

        input[type=submit] {
            margin: 10px;
            border: 0px;
            color: white;
            background-color: black;
            border-bottom: 1px solid lightgrey;
        }
        .bundle-text{
            padding:5px 0px 5px 0px;
            margin:0;
            font-size: 0.9em;
        }
        .total-text{
            padding:5px 0px 5px 0px;
            margin:0;
            font-weight:bold;
            font-size: 1em;
        }
    </style>
</head>
<body>
    <form method="POST" id="weekly_calender_form" runat="server">
        <div class="raffle-bundle-container">
            <p class="title-text">Q-3 Raffle Bundle</p>
            <label>Enter number of tickets you want to buy</label>
            <asp:TextBox ID="no_of_tickets_input" runat="server"></asp:TextBox>
            <div>
                <input type="submit" value="Get Tickets" />
            </div>
            <section>
                <asp:RegularExpressionValidator runat="server" EnableClientScript="true" ControlToValidate="no_of_tickets_input" ValidationExpression="^[0-9]*$" ErrorMessage="Please enter valid value for getting tickets."></asp:RegularExpressionValidator>
            </section>
            <section>
                <asp:RequiredFieldValidator runat="server" EnableClientScript="true" ErrorMessage="Please enter value for number of tickets." ControlToValidate="no_of_tickets_input"></asp:RequiredFieldValidator>
            </section>
            <div id="raffle_bundle_output_container" runat="server" class="raffle-bundle-items">
            </div>
        </div>
    </form>
</body>
</html>
