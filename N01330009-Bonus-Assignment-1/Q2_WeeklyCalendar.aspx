<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Q2_WeeklyCalendar.aspx.cs" Inherits="N01330009_Bonus_Assignment_1.Q2_WeeklyCalendar" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        /* 
            Date: 6th Oct 2019
            Resources: https://fonts.google.com/?selection.family=Merriweather+Sans 
            Google Fonts - Custom fonts Library
        */

        @import url('https://fonts.googleapis.com/css?family=Merriweather+Sans&display=swap');

        * {
            font-family: 'Merriweather Sans', sans-serif;
            box-sizing: border-box;
        }
        .calender-items{
            display: flex;
            flex-wrap: wrap;
            margin: 0 auto;
            align-content: center;
            width: 63.5%;
            justify-content: stretch;
        }
        .calender-items .date-block {
            width: 120px;
            height: 100px;
        }
        .title-text {
            margin-top: 0;
            background-color: black;
            padding: 10px;
            color: white;
        }
        .calender-container {
            margin: 0 auto;
            width: 70%;
            border: 1px solid #cfd8dc;
        }
        .date-block{
            text-align: center;
            padding: 7px;
            border: 1px solid #cfd8dc;
        }
        .date-block .date-number {
            margin: 0;
            color: white;
            font-size: 1.3em;
            font-weight: bold;
            margin-top: 10px;
        }
        .date-block .date-name {
            margin: 0;
        }
        .date-block .info-text {
            font-size: 0.7em;
            display: block;
        }
        .date-block .day-text {
            font-size: 0.8em;
            display: block;
        }
        .working-day {
            background-color: #e57373;
        }
        .fun-day {
            background-color: #29b6f6;
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
    </style>
</head>
<body>
    <form method="POST" id="weekly_calender_form" runat="server">
        <div class="calender-container">
                <p class="title-text">Select your working Days</p>
                <asp:CheckBoxList runat="server" ID="user_working_days">
                    <asp:ListItem Value="Monday">Monday</asp:ListItem>
                    <asp:ListItem Value="Tuesday">Tuesday</asp:ListItem>
                    <asp:ListItem Value="Wednesday">Wednesday</asp:ListItem>
                    <asp:ListItem Value="Thursday">Thursday</asp:ListItem>
                    <asp:ListItem Value="Friday">Friday</asp:ListItem>
                    <asp:ListItem Value="Saturday">Saturday</asp:ListItem>
                    <asp:ListItem Value="Sunday">Sunday</asp:ListItem>
                </asp:CheckBoxList>
       
            <div>
                <input type="submit" value="Generate Calender" />
            </div>
        </div>
        <div id="calender_output_container" runat="server" class="calender-items">

        </div>
    </form>
</body>
</html>
