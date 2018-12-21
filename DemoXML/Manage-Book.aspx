<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage-Book.aspx.cs" Inherits="DemoXML.Manage_Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-weight: bold;
            background-color: #FFFFCC;
        }
        .auto-style2 {
            text-align: left;
            width: 87px;
            background-color: #FFFFCC;
        }
        .auto-style3 {
            text-align: center;
            font-weight: bold;
            width: 90px;
            background-color: #FFFFCC;
        }
        .auto-style4 {
            text-align: center;
            font-weight: bold;
            width: 211px;
            background-color: #FFFFCC;
        }
        .auto-style5 {
            font-weight: bold;
            width: 90px;
            background-color: #FFFFCC;
        }
        .auto-style6 {
            text-align: left;
            width: 211px;
            background-color: #FFFFCC;
        }
        .auto-style7 {
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            font-size: x-large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p class="auto-style8">
            <strong><span class="auto-style9">&nbsp;QUẢN LÝ THÔNG TIN SÁCH</span></strong>
        </p>
        <table border="1" class="auto-style7">
            <tr>
                <td class="auto-style1" colspan="2">Thêm sách</td>
                <td class="auto-style4">Thống kê</td>
            </tr>
            <tr>
                <td class="auto-style2">Mã sách</td>
                <td class="auto-style3"><asp:TextBox ID="txtId" runat="server"></asp:TextBox></td>
                <td class="auto-style6"><asp:LinkButton ID="lblAllBooks" runat="server" OnClick="lblAllBooks_Click">Tất cả sách</asp:LinkButton></td>
            </tr>
            <tr>
                <td class="auto-style2">Tên sách</td>
                <td class="auto-style3"><asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                <td class="auto-style6"><asp:LinkButton ID="lbPriceFilter" runat="server" OnClick="lbPriceFilter_Click">Những sách có giá bán từ 15000</asp:LinkButton></td>
            </tr>
            <tr>
                <td class="auto-style2">Loại sách</td>
                <td class="auto-style3"><asp:TextBox ID="txtCategoryBook" runat="server"></asp:TextBox></td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Tác giả</td>
                <td class="auto-style3"><asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox></td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Nhà xuất bản</td>
                <td class="auto-style3"><asp:TextBox ID="txtPublisher" runat="server"></asp:TextBox></td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">Giá bán</td>
                <td class="auto-style3"><asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style5"><asp:Button ID="btnInsert" runat="server" Text="Thêm mới" BackColor="#3399FF" OnClick="btnInsert_Click" /></td>
                <td class="auto-style4">&nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:Label ID="Label1" runat="server" Text="Tìm kiếm theo mã sách:"></asp:Label><asp:TextBox ID="txtIdSearch" runat="server"></asp:TextBox>
        <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Tìm kiếm" />
        <p>
            <em>Danh sách sách
        </em>
        </p>

        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="920px" BorderColor="Black" BorderWidth="1px">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Mã sách" ReadOnly="true" />
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
