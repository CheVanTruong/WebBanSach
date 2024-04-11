<%@ Page Title="" Language="C#" MasterPageFile="~/Layout.Master" AutoEventWireup="true" CodeBehind="ThemSach.aspx.cs" Inherits="WebBanSach.ThemSach" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h2>TRANG THÊM SÁCH MỚI</h2>
    <hr />
    <div class="form-group">
        <label>Tên Sách</label>
    <asp:TextBox ID="txtTen" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator ID="rfvTen" runat="server" ControlToValidate="txtTen" Text="(*)" ForeColor="Red" 
        ErrorMessage="Tên sách không được bỏ trống"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group">
        <label>Giá bán</label>
        <asp:TextBox ID="txtDongia" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfvDongia" runat="server" ControlToValidate="txtDongia" Text="(*)" ForeColor="Red"
            ErrorMessage="Tên sách không được bỏ trống"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cvDongia" runat="server" ControlToValidate="txtDongia" Operator="GreaterThanEqual"
            ValueToCompare="0" Type="Double" Text="(*)" CssClass="text-danger"
            ErrorMessage="Đơn giá không hợp lệ (phải >=0)"></asp:CompareValidator>
    </div>

    <div class="form-group">
        <label>Ảnh bìa</label>
        <asp:FileUpload ID="Fhinh" runat="server" />
    </div>
    <div class="form-group">
        <label>Chủ đề</label>
        <asp:DropDownList ID="ddlChuDe" runat="server" CssClass="form-control"
           DataSourceID="dsChuDe" DataTextField="TenCD" DataValueField="MaCD" ></asp:DropDownList>
    </div>
    <div class="form-group">
        <label>Nhà xuất bản</label>
        <asp:DropDownList ID="ddlNXB" runat="server" CssClass="form-control"
            DataSourceID="dsNXB" DataTextField="TenNXB" DataValueField="manxb">
        </asp:DropDownList>
    </div>
    <div class="form-group">
        <label>Ngày cập nhật</label>
        <asp:TextBox ID="txtNgayCapNhat" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
    </div>
<asp:Button ID="btThem" runat="server" Text="Thêm" OnClick="btThem_Click" />

<asp:SqlDataSource ID="dsChuDe" runat="server"
    ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>"
    SelectCommand="SELECT * FROM [ChuDe]"></asp:SqlDataSource>

<asp:SqlDataSource ID="dsNXB" runat="server" 
    ConnectionString="<%$ ConnectionStrings:BookStoreConnectionString %>" 
    SelectCommand="SELECT * FROM [NhaXuatBan]"></asp:SqlDataSource>
</asp:Content>
