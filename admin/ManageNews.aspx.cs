using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace jobportal.admin
{
    public partial class ManageNews : System.Web.UI.Page
    {
        SqlConnection con;
        SqlCommand cmd;
        string str = ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
        string query;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin"] == null)
            {
                Response.Redirect("../User/Login.aspx");
            }
            Session["title"] = "Add Job";
            if (!IsPostBack)
            {
                fillData();
            }
        }

        private void fillData()
        {
            if (Request.QueryString["id"] != null)
            {
                con = new SqlConnection(str);
                query = "select * from News where NewsId='" + Request.QueryString["id"] + "'";
                cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader sdr = cmd.ExecuteReader();
                if (sdr.HasRows)
                {
                    while (sdr.Read())
                    {
                        txtTitle.Text = sdr["Title"].ToString();
                        txtDescription.Text = sdr["Description"].ToString();

                        linkBack.Visible = true;
                        Session["title"] = "Edit Job";
                    }
                }
                else
                {
                    lblMsg.Text = "Job not fount!";
                    lblMsg.CssClass = "alert alert-danger";
                }
                sdr.Close();
                con.Close();
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string type, concatQuery, imagePath = string.Empty;
                bool isValidToExecute = false;
                con = new SqlConnection(str);
                if (Request.QueryString["id"] != null)
                {
                    if (fileImage.HasFile)
                    {
                        if (Utils.IsValidExtention(fileImage.FileName))
                        {
                            concatQuery = "Image=@CompanyImage,";
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, jpeg, png file for Logo";
                            lblMsg.CssClass = "alert alert-danger";
                            return;
                        }
                    }
                    else
                    {
                        concatQuery = string.Empty;
                    }

                    query = @"update News set Title=@Title, "+ concatQuery +@"Description=@Description where NewsId=@id";
                    // Added spaces before where
                    type = "updated";
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    cmd.Parameters.AddWithValue("@id", Request.QueryString["id"].ToString());

                    if (fileImage.HasFile && Utils.IsValidExtention(fileImage.FileName))
                    {
                        Guid obj = Guid.NewGuid();
                        imagePath = "Images/" + obj.ToString() + fileImage.FileName;
                        fileImage.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fileImage.FileName);

                        cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        isValidToExecute = true;
                    }
                    else
                    {
                        // No image file selected, execute without updating image
                        isValidToExecute = true;
                    }
                }

                else
                {
                    query = @"insert into News values(@Title, @Description, @CompanyImage)";
                    type = "saved";
                    DateTime time = DateTime.Now;
                    cmd = new SqlCommand(query, con);
                    cmd.Parameters.AddWithValue("@Title", txtTitle.Text.Trim());
                    cmd.Parameters.AddWithValue("@Description", txtDescription.Text.Trim());
                    
                    imagePath = "default_image.jpg";

                    if (fileImage.HasFile)
                    {
                        if (Utils.IsValidExtention(fileImage.FileName))
                        {
                            Guid obj = Guid.NewGuid();
                            imagePath = "Images/" + obj.ToString() + fileImage.FileName;
                            fileImage.PostedFile.SaveAs(Server.MapPath("~/Images/") + obj.ToString() + fileImage.FileName);

                            cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                            isValidToExecute = true;
                        }
                        else
                        {
                            lblMsg.Text = "Please select .jpg, jpeg, png file for Logo";
                            lblMsg.CssClass = "alert alert-danger";
                            return;
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@CompanyImage", imagePath);
                        isValidToExecute = true;
                    }
                }

                if (isValidToExecute)
                {
                    con.Open();
                    int res = cmd.ExecuteNonQuery();
                    if (res > 0)
                    {
                        lblMsg.Text = "News " + type + " successful..!";
                        lblMsg.CssClass = "alert alert-success";
                        clear();
                    }
                    else
                    {
                        lblMsg.Text = "Cannot " + type + " the records please try after sometime..!";
                        lblMsg.CssClass = "alert alert-danger";
                    }
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


        private void clear()
        {
            txtTitle.Text = string.Empty;
          
            txtDescription.Text = string.Empty;
           
        }








       
    
    }
}