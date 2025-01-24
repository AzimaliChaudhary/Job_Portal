using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Drawing;

namespace jobportal.admin
{
    public partial class ViewResume : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }

            if (!IsPostBack)
            {
                ShowJobAppliedJob();
            }
        }

        private void ShowJobAppliedJob()
        {
            string query = string.Empty;
            con = new SqlConnection(str);
            query = @"SELECT Row_Number() OVER(Order by (SELECT 1)) AS [Sr.No], 
                 aj.AppliedJobId, j.CompanyName, aj.JobId, j.Title, 
                 u.Mobile, u.Name, u.Email, u.Resume, aj.Status
          FROM AppliedJobs aj
          INNER JOIN [User] u ON aj.UserId = u.UserId
          INNER JOIN Jobs j ON aj.JobId = j.JobId";
//                @"select Row_Number() over(Order by (Select 1)) as[Sr.No],aj.AppliedJobId,j.CompanyName,aj.JobId,j.Title,u.Mobile,
//                 u.Name,u.Email,u.Resume from AppliedJobs aj
//                 inner join [User] u on aj.UserId=u.UserId
//                  inner join Jobs j on aj.JobId=j.JobId";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowJobAppliedJob();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridView1.Rows[e.RowIndex];
                int appliedJobId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
                con = new SqlConnection(str);
                cmd = new SqlCommand("delete from AppliedJobs where AppliedJobId=@id", con);
                cmd.Parameters.AddWithValue("@id", appliedJobId);
                con.Open();
                int r = cmd.ExecuteNonQuery();
                if (r > 0)
                {
                    lblMsg.Text = "Resume deleted successfully!";
                    lblMsg.CssClass = "alert alert-success";
                }
                else
                {
                    lblMsg.Text = "Cannot delete this record!";
                    lblMsg.CssClass = "alert alert-danger";
                }
                GridView1.EditIndex = -1;
                ShowJobAppliedJob();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
            finally
            {
                con.Close(); 
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            //e.Row.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "select$" + e.Row.RowIndex);
            //e.Row.ToolTip = "click to view job details";

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                TableCell companyNameCell = e.Row.Cells[1]; 
                companyNameCell.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "select$" + e.Row.RowIndex);
                companyNameCell.ToolTip = "Click to view job details";

                
                TableCell jobTitleCell = e.Row.Cells[2]; 
                jobTitleCell.Attributes["onclick"] = Page.ClientScript.GetPostBackClientHyperlink(GridView1, "select$" + e.Row.RowIndex);
                jobTitleCell.ToolTip = "Click to view job details";
            }

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                string status = rowView["Status"].ToString();

                Button btnAccept = (Button)e.Row.FindControl("btnAccept");
                Button btnReject = (Button)e.Row.FindControl("btnReject");

                if (status == "Pending")
                {
                    btnAccept.Enabled = true;
                    btnReject.Enabled = true;
                }
                else
                {
                    btnAccept.Enabled = false;
                    btnReject.Enabled = false;
                }
            }
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in GridView1.Rows)
            {
                if (row.RowIndex == GridView1.SelectedIndex)
                {
                    HiddenField jobId = (HiddenField)row.FindControl("hdnJobId");
                    Response.Redirect("JobList.aspx?id=" + jobId.Value);
                }
                else
                {
                    row.BackColor = ColorTranslator.FromHtml("#FFFFFF");
                    row.ToolTip = "Click to select this row";
                }
            }
        }
        protected void btnAccept_Click(object sender, EventArgs e)
        {
            Button btnAccept = (Button)sender;
            GridViewRow row = (GridViewRow)btnAccept.NamingContainer;
            int appliedJobId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["AppliedJobId"]);

            
            UpdateStatus(appliedJobId, "Accepted");
            btnAccept.Enabled = false;
            
            ShowJobAppliedJob();
        }
        protected void btnReject_Click(object sender, EventArgs e)
        {
            Button btnReject = (Button)sender;
            GridViewRow row = (GridViewRow)btnReject.NamingContainer;
            int appliedJobId = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values["AppliedJobId"]);

            
            UpdateStatus(appliedJobId, "Rejected");
            btnReject.Enabled = false;
           
            
            ShowJobAppliedJob();
        }
        private void UpdateStatus(int appliedJobId, string status)
        {
            string query = "UPDATE AppliedJobs SET Status = @Status WHERE AppliedJobId = @AppliedJobId";
            using (SqlConnection con = new SqlConnection(str))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Status", status);
                    cmd.Parameters.AddWithValue("@AppliedJobId", appliedJobId);
                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }
        }
        
    }
}