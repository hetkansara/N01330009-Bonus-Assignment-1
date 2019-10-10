using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N01330009_Bonus_Assignment_1
{
    public partial class Q1_CoordinateCheck : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.IsPostBack) {
                // Validate X & Y Co-ordinate values.
                Page.Validate();
                
                //If everything seems okay, we can proceed.
                if (Page.IsValid) {
                    //Set default class for all quadrant containers in axis-graph.
                    top_left_co_ordinates_container.Attributes["class"] = "top-left-co-ordinates-container";
                    top_right_co_ordinates_container.Attributes["class"] = "top-right-co-ordinates-container";
                    bottom_left_co_ordinates_container.Attributes["class"] = "bottom-left-co-ordinates-container";
                    bottom_right_co_ordinates_container.Attributes["class"] = "bottom-right-co-ordinates-container";

                    double x_coordinate_value = Math.Round(float.Parse(x_coordinate_input.Text.ToString()), 2);
                    double y_coordinate_value = Math.Round(float.Parse(y_coordinate_input.Text.ToString()), 2);
                    string current_quadrant;
                    string quadrant_text = "";

                    // If Y-Axis > 0, Co-ordinates are in one of the upper Quadrant (Quadrant - 1 OR Quadrant -2)
                    if (y_coordinate_value > 0) {
                        current_quadrant = "top";
                    } else {
                        current_quadrant = "bottom";
                    }

                    // If X-Axis > 0, Co-ordinates are on the Right. Else, Left!
                    if (x_coordinate_value > 0) {
                        current_quadrant += "-right";
                    } else {
                        current_quadrant += "-left";
                    }

                    // Finally, We got our class of current Quadrant in valiable 'current_quadrant'.

                    //Generate Graph & Display Quadrant text.
                    switch (current_quadrant) {
                        case "top-left":
                            quadrant_text = "Quadrant II";
                            top_left_co_ordinates_container.Attributes["class"] += " active-quadrant";
                            top_left_co_ordinates_container.InnerHtml = quadrant_text;
                            break;
                        case "top-right":
                            quadrant_text = "Quadrant I";
                            top_right_co_ordinates_container.Attributes["class"] += " active-quadrant";
                            top_right_co_ordinates_container.InnerHtml = quadrant_text;
                            break;
                        case "bottom-left":
                            quadrant_text = "Quadrant III";
                            bottom_left_co_ordinates_container.Attributes["class"] += " active-quadrant";
                            bottom_left_co_ordinates_container.InnerHtml = quadrant_text;
                            break;
                        case "bottom-right":
                            quadrant_text = "Quadrant IV";
                            bottom_right_co_ordinates_container.Attributes["class"] += " active-quadrant";
                            bottom_right_co_ordinates_container.InnerHtml = quadrant_text;
                            break;
                        default:
                            // No default case for now.
                            break;
                    }

                    quadrants_container.InnerHtml = "Co-ordinates (" + x_coordinate_value +", " + y_coordinate_value + ") falls in " + quadrant_text + ".";

                } 
                else {
                    quadrants_container.InnerHtml = "";
                }
            }
        }

        // Custom validator for checking X-Axis & Y-Axis non-zero values
        protected void validateAxisValue(object source, ServerValidateEventArgs args)
        {
            if (Convert.ToInt32(args.Value) == 0)
            {
                args.IsValid = false;
            } else
            {
                args.IsValid = true;
            }
        }
    }
}