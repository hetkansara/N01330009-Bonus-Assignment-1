<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Q1_CoordinateCheck.aspx.cs" Inherits="N01330009_Bonus_Assignment_1.Q1_CoordinateCheck" %>

    <!DOCTYPE html>

    <html xmlns="http://www.w3.org/1999/xhtml">

    <head runat="server">
        <title></title>
        <style>
            /* 
                Date: 5th Oct, 2019
                Resources: https://css-tricks.com/snippets/css/css-triangle/ 
                Used extenral library to display arrows of the axis and mannualy set the position of all arrow triangles.
            */
            /* 
                Date: 5th Oct 2019
                Resources: https://fonts.google.com/?selection.family=Merriweather+Sans 
                Google Fonts - Custom fonts Library
            */

            @import url('https://fonts.googleapis.com/css?family=Merriweather+Sans&display=swap');

            * {
                font-family: 'Merriweather Sans', sans-serif;
                box-sizing: border-box;
            }

            /* Positioning all arrows */
            .arrow-up {
                width: 0;
                height: 0;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-bottom: 10px solid black;
                position: absolute;
                margin-left: 90px;
                margin-top: -10px;
            }

            .arrow-down {
                width: 0;
                height: 0;
                border-left: 10px solid transparent;
                border-right: 10px solid transparent;
                border-top: 10px solid black;
                position: absolute;
                margin-left: 90px;
                margin-top: 200px;
            }

            .arrow-right {
                width: 0;
                height: 0;
                border-top: 10px solid transparent;
                border-bottom: 10px solid transparent;
                border-left: 10px solid black;
                position: absolute;
                margin-left: 200px;
                margin-top: 90px;
            }

            .arrow-left {
                width: 0;
                height: 0;
                border-top: 10px solid transparent;
                border-bottom: 10px solid transparent;
                border-right: 10px solid black;
                position: absolute;
                margin-left: -10px;
                margin-top: 90px;
            }

            .co-ordinates-chart {
                margin: 0 auto;
                width: 200px;
                height: 200px;
                padding-top: 50px;
            }

            .top-left-co-ordinates-container,
            .bottom-left-co-ordinates-container {
                width: 100px;
                height: 100px;
                border-right: 1px solid black;
                float: left;
                line-height: 100px;
                text-align: center;
                color: white;
            }

            .top-right-co-ordinates-container,
            .bottom-right-co-ordinates-container {
                width: 100px;
                height: 100px;
                float: right;
                line-height: 100px;
                text-align: center;
                color: white;
            }

            .bottom-right-co-ordinates-container,
            .bottom-left-co-ordinates-container {
                border-top: 1px solid black;
            }

            .active-quadrant {
                background-color: #039be5;
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

            .co-ordinates-container {
                margin: 0 auto;
                width: 50%;
                height: 200px;
                border: 1px solid lightgrey;
                min-height: 280px;
            }

            .quadrants-container {
                text-align: center;
                margin-top: 70px;
            }

            .title-text {
                margin-top: 0;
                background-color: black;
                padding: 10px;
                color: white;
            }

            .co-ordinates-form {
                padding-left: 10px;
            }

            .x-axis-text {
                position: absolute;
                margin-left: 220px;
                font-size: 0.8em;
                font-style: italic;
                margin-top: 90px;
            }

            .y-axis-text {
                position: absolute;
                margin-left: 80px;
                font-size: 0.8em;
                font-style: italic;
                margin-top: -30px;
            }
        </style>
    </head>

    <body>
        <form method="POST" id="coordinate_form" runat="server">
            <div class="co-ordinates-container">
                <p class="title-text">Enter your co-ordinates here</p>
                <section class="co-ordinates-form">
                    <label>(X: </label>
                    <asp:TextBox ID="x_coordinate_input" runat="server"></asp:TextBox>
                    <label>, Y: </label>
                    <asp:TextBox ID="y_coordinate_input" runat="server"></asp:TextBox>
                    <label>)</label>
                    <div>
                        <input type="submit" value="Submit" />
                    </div>
                    <section>
                        <!-- Validate X-Axis for non-zero value -->
                        <asp:CustomValidator runat="server" 
                            ControlToValidate="x_coordinate_input" 
                            ErrorMessage="X-Axis value can not be zero." OnServerValidate="validateAxisValue">
                        </asp:CustomValidator>
                    </section>
                    <section>
                        <!-- Validate Y-Axis for non-zero value -->
                        <asp:CustomValidator runat="server" 
                            ControlToValidate="y_coordinate_input" 
                            ErrorMessage="Y-Axis value can not be zero." OnServerValidate="validateAxisValue">

                        </asp:CustomValidator>
                    </section>
                    <section>
                        <!-- 
                            - Regex taken from https://stackoverflow.com/questions/33939770/regex-for-decimal-number-validation-in-c-sharp
                            - Checks negative & positive decimal numbers
                            - Date: 5th Oct, 2019
                        -->
                        <asp:RegularExpressionValidator runat="server" EnableClientScript="true" ControlToValidate="x_coordinate_input" ValidationExpression="^-?[0-9]*\.?[0-9]+$"
                            ErrorMessage="Please enter valid X co-ordinate value."></asp:RegularExpressionValidator>
                    </section>
                    <section>
                        <asp:RequiredFieldValidator runat="server" EnableClientScript="true" ErrorMessage="Please enter X co-ordinate value." ControlToValidate="x_coordinate_input"></asp:RequiredFieldValidator>
                    </section>
                    <section>
                        <!-- 
                            - Regex taken from https://stackoverflow.com/questions/33939770/regex-for-decimal-number-validation-in-c-sharp
                            - Checks negative & positive decimal numbers
                            - Date: 5th Oct, 2019
                        -->
                        <asp:RegularExpressionValidator runat="server" EnableClientScript="true" ControlToValidate="y_coordinate_input" ValidationExpression="^-?[0-9]*\.?[0-9]+$"
                            ErrorMessage="Please enter valid Y co-ordinate 
                    value."></asp:RegularExpressionValidator>
                    </section>
                    <section>
                        <asp:RequiredFieldValidator runat="server" EnableClientScript="true" ErrorMessage="Please enter Y co-ordinate value." ControlToValidate="y_coordinate_input"></asp:RequiredFieldValidator>
                    </section>
                </section>

                <!-- Axis Graph -->
                <div class="co-ordinates-chart">
                    <div class="arrow-up"></div>
                    <div id="top_left_co_ordinates_container" class="top-left-co-ordinates-container" runat="server"></div>
                    <div id="top_right_co_ordinates_container" class="top-right-co-ordinates-container" runat="server"></div>
                    <div class="arrow-left"></div>
                    <div class="arrow-right"></div>
                    <div id="bottom_left_co_ordinates_container" class="bottom-left-co-ordinates-container" runat="server"></div>
                    <div id="bottom_right_co_ordinates_container" class="bottom-right-co-ordinates-container" runat="server"></div>
                    <div class="arrow-down"></div>
                    <p class="x-axis-text">X-Axis</p>
                    <p class="y-axis-text">Y-Axis</p>
                </div>
                <section class="quadrants-container" id="quadrants_container" runat="server">

                </section>
            </div>
        </form>
    </body>

    </html>