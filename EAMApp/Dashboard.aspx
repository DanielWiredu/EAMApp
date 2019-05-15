<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="EAMApp.Dashboard" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<script type="text/javascript">
             function exportRadHtmlChart() {
                 $find('<%=RadClientExportManager1.ClientID%>').exportPDF($(".RadHtmlChart"));
          }
    </script>--%>
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                       <p>Dashboard</p>

                         <div class="row" hidden="hidden">
           <%-- <div class="col-lg-3">
                <div class="widget style1 blue-bg">
                        <div class="row">
                            <div class="col-xs-4 text-center">
                                <i class="fa fa-trophy fa-5x"></i>
                            </div>
                            <div class="col-xs-8 text-right">
                                <span> Today income </span>
                                <h2 class="font-bold">$ 4,232</h2>
                            </div>
                        </div>
                </div>
            </div>--%>
            <div class="col-lg-3">
                <div class="widget style1 navy-bg">
                    <div class="row">
                        <%--<div class="col-xs-4">
                            <i class="fa fa-cloud fa-5x"></i>
                        </div>--%>
                        <div class="col-xs-12 text-right">
                            <span> Active Members </span>
                            <h2 class="font-bold" runat="server" id="lblActiveMembers"> </h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="widget style1 lazur-bg">
                    <div class="row">
                        <%--<div class="col-xs-4">
                            <i class="fa fa-envelope-o fa-5x"></i>
                        </div>--%>
                        <div class="col-xs-12 text-right">
                            <span> Visitors </span>
                            <h2 class="font-bold" runat="server" id="lblVisitors"> </h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="widget style1 yellow-bg">
                    <div class="row">
                       <%-- <div class="col-xs-4">
                            <i class="fa fa-music fa-5x"></i>
                        </div>--%>
                        <div class="col-xs-12 text-right">
                            <span>Inactive Members</span>
                            <h2 class="font-bold" runat="server" id="lblInactiveMembers"> </h2>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3">
                <div class="widget style1 red-bg">
                    <div class="row">
                       <%-- <div class="col-xs-4">
                            <i class="fa fa-music fa-5x"></i>
                        </div>--%>
                        <div class="col-xs-12 text-right">
                            <span> Services </span>
                            <h2 class="font-bold" runat="server" id="lblServices">  </h2>
                        </div>
                    </div>
                </div>
            </div>
        </div>

                          <div class="row">
                    <div class="col-md-6">
                   <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="chtPayFreqDistribution" Skin="Silk" DataSourceID="payfrepdistSource">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries Name="Total Partners" DataFieldY="PARTNERS">
                        <TooltipsAppearance Color="White"  />
                    </telerik:ColumnSeries>
                </Series>
                <XAxis  DataLabelsField="PAYFREQ">
                    <LabelsAppearance RotationAngle="75">
                    </LabelsAppearance>
                    <TitleAppearance Text="Payment Frequency">
                    </TitleAppearance>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Total Partners">
                    </TitleAppearance>
                </YAxis>
            </PlotArea>
            <Legend>
                <Appearance Visible="false">
                </Appearance>
            </Legend>
            <ChartTitle Text="Payment Frequency Distribution">
            </ChartTitle>
        </telerik:RadHtmlChart>

                    <asp:SqlDataSource ID="payfrepdistSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PAYFREQ, COUNT(ID) AS PARTNERS FROM TBLCOVENANTPARTNERS GROUP BY PAYFREQ"></asp:SqlDataSource>
                
                    <%--<telerik:RadButton ID="btnExport" Text="Export to PDF" runat="server" OnClientClicked="exportRadHtmlChart" UseSubmitBehavior="false" AutoPostBack="false"></telerik:RadButton>--%>
                    <%--<telerik:RadClientExportManager ID="RadClientExportManager1" runat="server"></telerik:RadClientExportManager>--%>

                    </div>
                            <div class="col-md-6">
                         <asp:SqlDataSource ID="paymodeSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT PAYMODE, COUNT(ID) AS PARTNERS FROM TBLCOVENANTPARTNERS GROUP BY PAYMODE"></asp:SqlDataSource>

                     <telerik:RadHtmlChart runat="server" Width="100%" Height="500px" ID="RadHtmlChart2" DataSourceID="paymodeSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:DonutSeries DataFieldY="PARTNERS" NameField="PAYMODE" StartAngle="45">
                        <LabelsAppearance DataField="PAYMODE" Position="OutsideEnd" Visible="false"></LabelsAppearance>
                    </telerik:DonutSeries>
                </Series>
            </PlotArea>
            <Legend>
                <Appearance Visible="true" Position="Bottom">
                </Appearance>
            </Legend>
            <ChartTitle Text="Partners Payment Mode">
            </ChartTitle>
        </telerik:RadHtmlChart> 
                        </div>
                </div>
                    </div>
                </div>
            </div>


                </div>
        </div>
</asp:Content>
