<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MonthlyLineChartPerYear.aspx.cs" Inherits="EAMApp.Reports.MonthlyLineChartPerYear" %>

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
                            <label>Year</label>
                            <telerik:RadDropDownList ID="dlYear" runat="server" Width="100%"> </telerik:RadDropDownList>
                        </div>
                        <div class="col-md-1">
                            <label>Run</label>
                             <asp:Button ID="btnRun" runat="server" Text="Run" CssClass="btn-success" Width="100%"  OnClick="btnRun_Click"/>
                        </div>
                    </div>
                <%--</div>--%>

                 <telerik:RadHtmlChart runat="server" Width="100%" Height="600px" ID="RadHtmlChart2" DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:LineSeries DataFieldY="Y2018" Name="2018" MissingValues="Interpolate">
                        <LineAppearance Width="3" />
                         <Appearance>
                             <FillStyle BackgroundColor="OrangeRed" />
                         </Appearance>
                         <MarkersAppearance MarkersType="Square"/>
                         <LabelsAppearance Color="DarkRed" DataField="Y2018" Position="Left" DataFormatString="{0:N2}" Visible="false">
                              <TextStyle Bold="true" FontSize="12" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:N2}"></TooltipsAppearance>
                    </telerik:LineSeries>
                    <telerik:LineSeries DataFieldY="Y2019" Name="2019" MissingValues="Interpolate">
                        <LineAppearance Width="3" />
                         <Appearance>
                             <FillStyle BackgroundColor="Green" />
                         </Appearance>
                         <MarkersAppearance MarkersType="Circle"/>
                         <LabelsAppearance Color="DarkRed" DataField="Y2019" Position="Left" DataFormatString="{0:N2}" Visible="false">
                              <TextStyle Bold="true" FontSize="12" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:N2}"></TooltipsAppearance>
                    </telerik:LineSeries>

                </Series>
                 <XAxis DataLabelsField="MONTHDESC" Type="Category">
                    <LabelsAppearance RotationAngle="0">
                        <TextStyle FontSize="18" />
                    </LabelsAppearance>
                    <TitleAppearance Text="Pay Month" Visible="false">
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Contribution">
                        <TextStyle Bold="true" FontSize="18" />
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Bottom" Orientation="Horizontal">
                    <TextStyle Bold="true" FontSize="16" />
                </Appearance>
            </Legend>
            <ChartTitle Text="">
                <Appearance><TextStyle Bold="true" FontSize="26" /></Appearance>
            </ChartTitle>
        </telerik:RadHtmlChart>
                <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetNowPrevYearChart" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="dlCurrency" Name="currency" PropertyName="SelectedValue" />
                        <asp:ControlParameter ControlID="dlYear" Name="nowYear" PropertyName="SelectedText" />
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
