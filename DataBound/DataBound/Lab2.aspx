<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Lab2.aspx.cs" Inherits="DataBound.SeachProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 270px;
        }
        .auto-style2 {
            width: 209px;
        }
        .auto-style4 {
            width: 243px;
        }
        .auto-style6 {
            height: 41px;
        }
        .auto-style7 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="width: 100%;">
                <tr>
                    <td colspan="3" style="font-weight: bold;  font-size:20pt" class="auto-style6" >Select Order Information By Staff.</td>
                </tr>
                <tr>
                    <td class="auto-style1" style="font-weight: bold">Please select staff name:</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td style="font-weight: bold">Please Select Year:</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:DropDownList ID="ddlName" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="EmployeeID" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:RadioButtonList ID="ddlYear" runat="server" DataSourceID="SqlDataSource2" DataTextField="Yr" DataValueField="Yr" AutoPostBack="True">
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT LastName + ' ' + FirstName AS Name, EmployeeID FROM Employees"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT YEAR(OrderDate) AS Yr FROM Orders"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </div>
        <asp:Panel ID="Panel1" runat="server">
            <div style="font-size: 15pt; color: blue; text-decoration: underline; font-weight: bold">
                <asp:Label ID="lblTitleGridView" runat="server"></asp:Label>
            </div>
            
            <br />
            <table class="auto-style7">
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style4">
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" OnPageIndexChanging="GridView1_PageIndexChanging">
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT OrderID, OrderDate FROM Orders WHERE (EmployeeID = @empID) AND (YEAR(OrderDate) = @Yr)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="ddlName" Name="empID" PropertyName="SelectedValue" />
                                <asp:ControlParameter ControlID="ddlYear" Name="Yr" PropertyName="SelectedValue" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Label ID="lblOldSales" runat="server"></asp:Label>
                        <br />
                        <br />
                        <asp:DataList ID="DataList1" runat="server">
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style4">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
            <br />
        </asp:Panel>
    </form>
</body>
</html>
