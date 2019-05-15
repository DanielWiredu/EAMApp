<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyChartByPayMode.aspx.cs" Inherits="EAMApp.Reports.MonthlyChartByPayMode" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="/Content/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/Content/css/style.css" rel="stylesheet"/>

     <script src="/Content/js/jquery-2.1.1.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
           <telerik:RadSkinManager ID="RadSkinManager1" runat="server" Skin="Office2010Blue"></telerik:RadSkinManager>

        <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                       <%--<p>Payment Monthly Chart</p>--%>

                         <%--<div class="form-group">--%>
                    <div class="row">
                        <div class="col-md-3">
                            <label>Currency</label>
                            <telerik:RadComboBox ID="dlCurrency" runat="server" Width="100%" DataSourceID="currencySource" DataTextField="Currency" DataValueField="Currency" Text="Select Currency"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="currencySource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Currency FROM [tblCurrency]"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <label>PayMode</label>
                            <telerik:RadComboBox ID="dlPayMode" runat="server" Width="100%" DataSourceID="payModeSource" DataTextField="PayMode" DataValueField="PayMode" Text="Select PayMode"></telerik:RadComboBox>
                            <asp:SqlDataSource ID="payModeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PayMode FROM [tblPayMode]"></asp:SqlDataSource>
                        </div>
                        <div class="col-md-3">
                            <label>Year</label>
                            <telerik:RadDropDownList ID="dlYear" runat="server" Width="100%"> </telerik:RadDropDownList>
                        </div>
                        <div class="col-md-1">
                            <label>Run</label>
                             <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn-success" Width="100%"  OnClick="btnRun_Click"/>
                        </div>
                    </div>
                <%--</div>--%>

                 <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart2"
            DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="AMOUNT" >
                        <LabelsAppearance Visible="true" DataField="AMOUNT">
                            <TextStyle FontSize="14" Bold="true" />
                        </LabelsAppearance>
                        <TooltipsAppearance Color="White" />
                    </telerik:ColumnSeries>      
                </Series>
                <XAxis DataLabelsField="PAYMONTH">
                    <LabelsAppearance >
                        <TextStyle FontSize="16"/>
                    </LabelsAppearance>
                    <TitleAppearance Text="Month">
                        <TextStyle FontSize="16" Bold="true" />
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Amount">
                        <TextStyle FontSize="18" Bold="true" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <%--<Legend>
                <Appearance Visible="true">
                    <TextStyle FontSize="18" Bold="true" />
                </Appearance>
            </Legend>--%>
            <ChartTitle Text="Monthly Payment Chart">
                <Appearance>
                    <TextStyle FontSize="24" Bold="true" />
                </Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select PAYMONTH, sum(amount) as AMOUNT from tblPayments where Currency = @Currency and PayMode = @PayMode and Payyear = @Payyear group by PAYMONTH">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dlCurrency" Name="Currency" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dlPayMode" Name="PayMode" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dlYear" Name="Payyear" PropertyName="SelectedText" />
                    </SelectParameters>
                </asp:SqlDataSource>

                  <telerik:RadButton ID="btnExport" Text="Export to PDF" runat="server" OnClientClicked="exportRadHtmlChart" UseSubmitBehavior="false" AutoPostBack="false"></telerik:RadButton>
                    <telerik:RadClientExportManager ID="RadClientExportManager1" runat="server"></telerik:RadClientExportManager>
       
                    </div>
                </div>
            </div>


                </div>
        </div>
    </div>

    <script>
      var $ = $telerik.$;
      function exportRadHtmlChart() {
        $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".RadHtmlChart"));
       }
    </script>
    </form>
</body>
</html>

