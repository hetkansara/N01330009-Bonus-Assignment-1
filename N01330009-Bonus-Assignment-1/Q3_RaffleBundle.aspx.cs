using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N01330009_Bonus_Assignment_1
{
    public partial class Q3_RaffleBundle : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    int no_of_tickets_value = Convert.ToInt32(no_of_tickets_input.Text); 
                    string htmlContent = "";
                    int bundle_value = 0;
                    int leftover_tickets = 0;

                    // Getting bundle value of tickets.    
                    if(no_of_tickets_value <= 50) {
                        bundle_value = 1;
                    } else if (no_of_tickets_value <= 150) {
                        bundle_value = 2;
                    } else if (no_of_tickets_value <= 300) {
                        bundle_value = 3;
                    } else {
                        bundle_value = 5;
                    }
                    
                    // Finding leftover tickets.
                    leftover_tickets = no_of_tickets_value%bundle_value;
                    
                    // Bundling tickets.
                    for(int bundle = bundle_value; bundle<=no_of_tickets_value; bundle+=bundle_value) {
                        htmlContent += "<p class='bundle-text'>You received a bundle of " + bundle_value + "! That’s " + bundle + " ticket(s)!</p>";
                    }
                    
                    // Displaying leftover tickets.
                    if(leftover_tickets != 0) {
                        htmlContent += "<p class='bundle-text'>The leftover is " + leftover_tickets+" ticket(s). That’s " + no_of_tickets_value + " ticket(s)!</p>";
                    }
                    
                    // Displaying total tickets & It's cost.
                    htmlContent += "<p class='total-text'>Your total ticket(s) is " + no_of_tickets_value + " and your cost is $" + (no_of_tickets_value * 0.25) + "cad!</p>";
                    
                    // Update HTML
                    raffle_bundle_output_container.InnerHtml = htmlContent;
                }
            }
        }
    }
}