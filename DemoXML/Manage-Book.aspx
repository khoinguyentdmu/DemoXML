<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage-Book.aspx.cs" Inherits="DemoXML.Manage_Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            DEMO QUẢN LÝ THÔNG TIN SÁCH</p>
        <p>
            Danh sách sách có trong thư viện</p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="920px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Mã sách" />
                    <asp:BoundField DataField="Name" HeaderText="Tên sách" />
                    <asp:BoundField DataField="CategoryBook" HeaderText="Loại sách" />
                    <asp:BoundField DataField="Author" HeaderText="Tác giả" />
                    <asp:BoundField DataField="Publisher" HeaderText="Nhà xuất bản" />
                    <asp:BoundField DataField="Price" HeaderText="Giá bán" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
        </p>
    </form>
</body>
</html>
