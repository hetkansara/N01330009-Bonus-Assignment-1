using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace N01330009_Bonus_Assignment_1
{
    public partial class Q2_WeeklyCalendar : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Assumed, Mapping Weekdays values to the numbers.
            // Monday - 1
            // Tuesday - 2
            // Wednesday - 3
            // Thursday - 4
            // Friday - 5
            // Saturday - 6
            // Sunday - 7
            // First day of this month is Tuesday. So, Initialized variable with the value 2.
            int firstDayOfTheMonth = 2;
            int currentDay = 1;

            // Used Each Weekday as a class and intialized instances in the list.
            List<WeekDay> workingOnWeekdays = new List<WeekDay>
            {
                new WeekDay("Monday", 1, false),
                new WeekDay("Tuesday", 2, false),
                new WeekDay("Wednesday", 3, false),
                new WeekDay("Thursday", 4, false),
                new WeekDay("Friday", 5, false),
                new WeekDay("Saturday", 6, false),
                new WeekDay("Sunday", 7, false)
            };
            

            if (Page.IsPostBack)
            {
                Page.Validate();
                if (Page.IsValid)
                {
                    // Set IsWorking attribute to appropriate value(true/false) for each day of the week.
                    foreach(ListItem workingDay in user_working_days.Items)
                    {
                        workingOnWeekdays[currentDay-1].IsWorking = workingDay.Selected;
                        currentDay++;
                    }

                    // Current Day initialized as first day of the month.
                    currentDay = firstDayOfTheMonth;

                    string htmlContent = "";
                    for(int index=1; index <= 31; index++) 
                    {
                        // Check if the day is working. Gets value from object of the class WeekDay
                        if(workingOnWeekdays[currentDay-1].IsWorking) {
                            // Working day
                            htmlContent += "<div class='date-block working-day'><p class='date-number'>" + index + "</p><p class='date-name'> October</p><span class='day-text'>"+ workingOnWeekdays[currentDay-1].NameOfTheDay +"</span><span class='info-text'>Time to work...</span></div>";
                        } else {
                            // Fun time
                            htmlContent += "<div class='date-block fun-day'><p class='date-number'>" + index + "</p><p class='date-name'> October</p><span class='day-text'>"+ workingOnWeekdays[currentDay-1].NameOfTheDay +"</span><span class='info-text'>Time to have fun!</span></div>";
                        }
                        currentDay++;
                        
                        // If current day is > 7, Re-iterate the weekdays from  1.
                        if(currentDay==8) {
                            currentDay = 1;
                        }
                    }

                    // Output Calender
                    calender_output_container.InnerHtml = htmlContent;
                }
            }
        }
    }

    /* 
        Date: 6th Oct 2019
        Resources: https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/object-and-collection-initializers
        Used class for storing multiple values(Weekday, Weeknumber, Workingday OR NOT) of a single entity(Weekday)
    */
    public class WeekDay
    {
        // Weekday properties.
        public string NameOfTheDay { get; set; }
        public int IndexOfTheDay { get; set; }
        public bool IsWorking;

        // Constructor
        public WeekDay(string dayName, int indexOfTheWeekDay, bool isWorkingDay)
        {
            this.NameOfTheDay = dayName;
            this.IndexOfTheDay = indexOfTheWeekDay;
            this.IsWorking = isWorkingDay;
        }

    }
}