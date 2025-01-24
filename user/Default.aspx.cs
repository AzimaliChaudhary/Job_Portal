using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace jobportal.user
{
    public partial class Default : System.Web.UI.Page
    {

        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter sda;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        public int jobCount = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showJobList();
                
            }
        }
//        protected void btnSearch_Click(object sender, EventArgs e)
//        {
//            string searchQuery = txtSearch.Text.Trim();

//            // Check if the search query is not empty
//            if (!string.IsNullOrEmpty(searchQuery))
//            {
//                // Construct the SQL query to search for jobs by title
//                string query = @"SELECT JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate 
//                 FROM Jobs
//                 WHERE Title LIKE @SearchQuery + '%'";

//                using (con = new SqlConnection(str))
//                {
//                    using (cmd = new SqlCommand(query, con))
//                    {
//                        // Set the parameter value
//                        cmd.Parameters.AddWithValue("@SearchQuery", searchQuery);

//                        // Open connection and execute the command
//                        con.Open();
//                        using (sda = new SqlDataAdapter(cmd))
//                        {
//                            dt = new DataTable();
//                            sda.Fill(dt);
//                        }
//                    }
//                }

//                // Bind the filtered job listings to the DataList control
//                DataList2.DataSource = dt;
//                DataList2.DataBind();

//                // Update the job count label
//                lbljobCount.Text = JobCount(dt.Rows.Count);
//            }
//        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string searchQuery = txtSearch.Text.Trim();

            
            if (!string.IsNullOrEmpty(searchQuery))
            {
                
                string query = @"SELECT JobId, Title, Salary, JobType, CompanyName, CompanyImage, Country, State, CreateDate 
                         FROM Jobs
                         WHERE Title LIKE @SearchQuery + '%'";

                using (con = new SqlConnection(str))
                {
                    using (cmd = new SqlCommand(query, con))
                    {
                        
                        cmd.Parameters.AddWithValue("@SearchQuery", searchQuery);

                        
                        con.Open();
                        using (sda = new SqlDataAdapter(cmd))
                        {
                            dt = new DataTable();
                            sda.Fill(dt);
                        }
                    }
                }

                
                DataList2.DataSource = dt;
                DataList2.DataBind();

                
                lbljobCount.Text = JobCount(dt.Rows.Count);
            }
            else
            {
                
                showJobList();

               
                DataList2.DataSource = null;
                DataList2.DataBind();

                
                lbljobCount.Text = JobCount(jobCount);
            }
        }


        string JobCount(int count)
        {
            if (count > 1)
            {
                return "Total <b>" + count + "</b> jobs found";
            }
            else if (count == 1)
            {
                return "Total <b>" + count + "</b> job found";
            }
            else
            {
                return "No job found";
            }
        }


        protected string GetImageUrl1(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);
        }


        

        //public static string RelativeDate(DateTime theDate)
        //{

        //    Dictionary<long, string> thresholds = new Dictionary<long, string>();

        //    int minute = 60;

        //    int hour = 60 * minute;

        //    int day = 24 * hour;

        //    thresholds.Add(60, "{0} seconds ago");

        //    thresholds.Add(minute * 2, "a minute ago");

        //    thresholds.Add(45 * minute, "{0} minutes ago");

        //    thresholds.Add(120 * minute, "an hour ago");

        //    thresholds.Add(day, "{0} hours ago");

        //    thresholds.Add(day * 2, "yesterday");

        //    thresholds.Add(day * 30, "{0} days ago");

        //    thresholds.Add(day * 365, "{0} months ago");

        //    thresholds.Add(long.MaxValue, "{0} years ago");

        //    long since = (DateTime.Now.Ticks - theDate.Ticks) / 10000000;

        //    foreach (long threshold in thresholds.Keys)
        //    {

        //        if (since < threshold)
        //        {

        //            TimeSpan t = new TimeSpan((DateTime.Now.Ticks - theDate.Ticks));

        //            return string.Format(thresholds[threshold], (t.Days > 365 ? t.Days / 365 : (t.Days > 0 ? t.Days : (t.Hours > 0 ? t.Hours : (t.Minutes > 0 ? t.Minutes : (t.Seconds > 0 ? t.Seconds : 0))))).ToString());

        //        }

        //    }

        //    return "";

        //}

        public static string RelativeDate(DateTime theDate)
        {
            TimeSpan timeSince = DateTime.Now - theDate;

            if (timeSince.TotalSeconds < 60)
            {
                return string.Format("{0} seconds ago", (int)timeSince.TotalSeconds);
            }
            if (timeSince.TotalMinutes < 60)
            {
                return string.Format("{0} minutes ago", (int)timeSince.TotalMinutes);
            }
            if (timeSince.TotalHours < 24)
            {
                return string.Format("{0} hours ago", (int)timeSince.TotalHours);
            }
            if (timeSince.TotalDays < 30)
            {
                return string.Format("{0} days ago", (int)timeSince.TotalDays);
            }
            if (timeSince.TotalDays < 365)
            {
                int months = (int)Math.Floor(timeSince.TotalDays / 30);
                return string.Format("{0} months ago", months);
            }
            return string.Format("{0} years ago", (int)Math.Floor(timeSince.TotalDays / 365));
        }


        private void showJobList()
        {
            if (dt == null)
            {
                con = new SqlConnection(str);
                string query = @"select NewsId,Title,Description,Image from News";
                cmd = new SqlCommand(query, con);
                sda = new SqlDataAdapter(cmd);
                dt = new DataTable();
                sda.Fill(dt);
            }
            DataList1.DataSource = dt;
            DataList1.DataBind();
            
        }
        protected string GetImageUrl(Object url)
        {
            string url1 = "";
            if (string.IsNullOrEmpty(url.ToString()) || url == DBNull.Value)
            {
                url1 = "~/Images/No_image.png";
            }
            else
            {
                url1 = string.Format("~/{0}", url);
            }
            return ResolveUrl(url1);
        }

        

       
    }
}