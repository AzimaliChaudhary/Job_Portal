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
    public partial class NewsList : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        DataTable dt;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }

            if (!IsPostBack)
            {
                ShowJob();
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            ShowJob();
        }

        private void ShowJob()
        {
            string query = string.Empty;
            con = new SqlConnection(str);
            query = @"select Row_Number() over(Order by (Select 1)) as[Sr.No],NewsId,Title,Description from News";
            cmd = new SqlCommand(query, con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            dt = new DataTable();
            sda.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
            if (Request.QueryString["id"] != null)
            {
                linkBack.Visible = true;
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            ShowJob();
        }


       protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
{
    try
    {
        GridViewRow row = GridView1.Rows[e.RowIndex];
        int newsId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
        con = new SqlConnection(str);
        cmd = new SqlCommand("DELETE FROM News WHERE NewsId=@id", con);
        cmd.Parameters.AddWithValue("@id", newsId);
        con.Open();
        int rowsAffected = cmd.ExecuteNonQuery();
        if (rowsAffected > 0)
        {
            lblMsg.Text = "News deleted successfully!";
            lblMsg.CssClass = "alert alert-success";
            
            ShowJob();
        }
        else
        {
            lblMsg.Text = "Cannot delete this record!";
            lblMsg.CssClass = "alert alert-danger";
        }
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

        


        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditJob")
            {
                Response.Redirect("ManageNews.aspx?id=" + e.CommandArgument.ToString());
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.ID = e.Row.RowIndex.ToString();
                if (Request.QueryString["id"] != null)
                {
                    int NewsId = Convert.ToInt32(GridView1.DataKeys[e.Row.RowIndex].Values[0]);
                    if (NewsId == Convert.ToInt32(Request.QueryString["id"]))
                    {
                        e.Row.BackColor = ColorTranslator.FromHtml("#A1DCF2");
                    }
                }
            }
        }
    }
}