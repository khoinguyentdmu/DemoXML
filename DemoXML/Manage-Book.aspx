<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Manage-Book.aspx.cs" Inherits="DemoXML.Manage_Book" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <strong>DEMO QUẢN LÝ THÔNG TIN SÁCH</strong>
        </p>
        <p>
            Danh sách sách có trong thư viện
        </p>
        <table>
            <tr>
                <td class="auto-style1">Thêm sách</td>
                <td class="auto-style1">Thống kê</td>
            </tr>
            <tr>
                <td>
                    <table>
                        <tr>
                            <td>Mã sách</td>
                            <td>
                                <asp:TextBox ID="txtId" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Tên sách</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Loại sách</td>
                            <td>
                                <asp:TextBox ID="txtCategoryBook" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Tác giả</td>
                            <td>
                                <asp:TextBox ID="txtAuthor" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Nhà xuất bản</td>
                            <td>
                                <asp:TextBox ID="txtPublisher" runat="server"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Giá bán</td>
                            <td>
                                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                    <asp:Button ID="btnInsert" runat="server" Text="Thêm mới" BackColor="#9999FF" OnClick="btnInsert_Click" />
                </td>
                <td>
                    <asp:LinkButton ID="lbPriceFilter" runat="server" OnClick="lbPriceFilter_Click">Lọc những sách có giá bán từ 15000</asp:LinkButton>
                    </td>
            </tr>
        </table>

        
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="Id" ForeColor="#333333" GridLines="None" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" Width="920px">
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
