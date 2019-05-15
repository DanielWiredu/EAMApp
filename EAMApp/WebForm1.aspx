<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="EAMApp.WebForm1" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                       <p>Dashboard</p>
                        <div class="alert alert-info" runat="server" id="lblMsg"></div>
                        <div class="modal-footer">
                                <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                        </div>
                    </div>
                </div>
            </div>
                </div>

         <%--<div class="row">
              <telerik:RadHtmlChart runat="server" Width="100%" Height="600px" ID="RadHtmlChart2" DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:LineSeries DataFieldY="Y2019" Name="2019" MissingValues="Interpolate">
                        <LineAppearance Width="3" />
                         <Appearance>
                             <FillStyle BackgroundColor="Blue" />
                         </Appearance>
                         <MarkersAppearance MarkersType="Square"/>
                         <LabelsAppearance Color="DarkRed" DataField="Y2019" Position="Left" DataFormatString="{0:#}" Visible="true">
                              <TextStyle Bold="true" FontSize="12" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:#}"></TooltipsAppearance>
                    </telerik:LineSeries>
                    <telerik:LineSeries DataFieldY="Y2018" Name="2018" MissingValues="Interpolate">
                        <LineAppearance Width="3" />
                         <Appearance>
                             <FillStyle BackgroundColor="OrangeRed" />
                         </Appearance>
                         <MarkersAppearance MarkersType="Square"/>
                         <LabelsAppearance Color="DarkRed" DataField="Y2018" Position="Left" DataFormatString="{0:#}" Visible="true">
                              <TextStyle Bold="true" FontSize="12" />
                         </LabelsAppearance>
                        <TooltipsAppearance Color="Yellow" DataFormatString="{0:#}"></TooltipsAppearance>
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
             <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select PAYMONTH, substring(DateName(M, DateAdd( month, PAYMONTH, -1 )),1,3) as 'MONTHDESC',
						sum(case PAYYEAR when 2019 then AMOUNT else 0 end) as 'Y2019', 
						sum(case PAYYEAR when 2018 then AMOUNT else 0 end) as 'Y2018' from tblPayments 
						group by PAYMONTH, substring(DateName(M, DateAdd( month, PAYMONTH, -1 )),1,3)
						order by PAYMONTH">
                </asp:SqlDataSource>
         </div>--%>

         <div class="row">
              <telerik:RadHtmlChart runat="server" Width="100%" Height="600px" ID="RadHtmlChart2" DataSourceID="chartSource" Skin="Silk">
            <PlotArea>
                <Series>
                    <telerik:ColumnSeries DataFieldY="Y2018" Name="2018 CONTRIBUTIONS">
                        <TooltipsAppearance Visible="false"></TooltipsAppearance>
                    </telerik:ColumnSeries>
                    <telerik:ColumnSeries DataFieldY="Y2019" Name="2019 CONTRIBUTIONS">
                        <TooltipsAppearance Visible="false"></TooltipsAppearance>
                    </telerik:ColumnSeries> 
                </Series>
                <XAxis DataLabelsField="MONTHDESC">
                    <LabelsAppearance></LabelsAppearance>
                    <MajorGridLines Visible="false"></MajorGridLines>
                    <MinorGridLines Visible="false"></MinorGridLines>
                </XAxis>
                <YAxis>
                    <TitleAppearance Text="Contribution"></TitleAppearance>
                    <MinorGridLines Visible="false"></MinorGridLines>
                </YAxis>
            </PlotArea>
            <ChartTitle Text="Yearly Contribution Comparison">
            </ChartTitle>
        </telerik:RadHtmlChart> 
             <asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetNowPrevYearChart" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                     <asp:Parameter Name="nowYear" Type="Int32" DefaultValue="2019" />
                 </SelectParameters>
                </asp:SqlDataSource>
             <%--<asp:SqlDataSource ID="chartSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="select PAYMONTH, substring(DateName(M, DateAdd( month, PAYMONTH, -1 )),1,3) as 'MONTHDESC',
						sum(case PAYYEAR when 2019 then AMOUNT else 0 end) as 'Y2019', 
						sum(case PAYYEAR when 2018 then AMOUNT else 0 end) as 'Y2018' from tblPayments 
						group by PAYMONTH, substring(DateName(M, DateAdd( month, PAYMONTH, -1 )),1,3)
						order by PAYMONTH">
                </asp:SqlDataSource>--%>
         </div>

        </div>
</asp:Content>
