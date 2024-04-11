using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            //mo ket noi csdl
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["BookStoreConnectionString"].ConnectionString);
            conn.Open();

            string sql = "INSERT INTO Sach (TenSach,MaCD,MaNXB,Dongia,Hinh,Ngaycapnhat) values(@TenSach,@MaCD,@MaNXB,@Dongia,@Hinh,@Ngaycapnhat)";
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.Parameters.AddWithValue("@TenSach", txtTen.Text);
            cmd.Parameters.AddWithValue("@MaCD", ddlChuDe.SelectedValue);
            cmd.Parameters.AddWithValue("@MaNXB", ddlNXB.SelectedValue);
            cmd.Parameters.AddWithValue("@Dongia", txtDongia.Text);
            cmd.Parameters.AddWithValue("@Ngaycapnhat", txtNgayCapNhat.Text);
            if (Fhinh.HasFile)
            {
                //Xu ly upload
                string path = Server.MapPath("~/bia_sach") + Fhinh.FileName;
                Fhinh.SaveAs(path);
                cmd.Parameters.AddWithValue("@Hinh", Fhinh.FileName);
            } else
            {
                cmd.Parameters.AddWithValue("@Hinh", "no_image.png");
            }

            if (cmd.ExecuteNonQuery() > 0) // them thanh cong
            {
                Response.Write("<script> alert('Đã thêm thành công') </script>");
            }
            else
            {
                Response.Write("<script> alert('Thao Tác thêm không thành công') </script>");
            }
        }
    }
}