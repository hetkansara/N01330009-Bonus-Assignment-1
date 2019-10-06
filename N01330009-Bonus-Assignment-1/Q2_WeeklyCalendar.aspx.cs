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
            int firstDayOfTheMonth = 2;
            int currentDay = 1;
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
                    foreach(ListItem workingDay in user_working_days.Items)
                    {
                        workingOnWeekdays[currentDay-1].IsWorking = workingDay.Selected;
                        currentDay++;
                    }

                    currentDay = firstDayOfTheMonth;
                    string htmlContent = "";
                    for(int index=1; index <= 31; index++) 
                    {
                        if(workingOnWeekdays[currentDay-1].IsWorking) {
                            htmlContent += "<div class='date-block working-day'><p class='date-number'>" + index + "</p><p class='date-name'> October</p><span class='day-text'>"+ workingOnWeekdays[currentDay-1].NameOfTheDay +"</span><span class='info-text'>Time to work...</span></div>";
                        } else {
                            htmlContent += "<div class='date-block fun-day'><p class='date-number'>" + index + "</p><p class='date-name'> October</p><span class='day-text'>"+ workingOnWeekdays[currentDay-1].NameOfTheDay +"</span><span class='info-text'>Time to have fun!</span></div>";
                        }
                        currentDay++;
                        if(currentDay==8) {
                            currentDay = 1;
                        }
                    }

                    calender_output_container.InnerHtml = htmlContent;
                }
            }
        }
    }

    //https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/object-and-collection-initializers
    public class WeekDay
    {
        // Auto-implemented properties.
        public string NameOfTheDay { get; set; }
        public int IndexOfTheDay { get; set; }
        public bool IsWorking;

        public WeekDay(string dayName, int indexOfTheWeekDay, bool isWorkingDay)
        {
            this.NameOfTheDay = dayName;
            this.IndexOfTheDay = indexOfTheWeekDay;
            this.IsWorking = isWorkingDay;
        }

    }
}