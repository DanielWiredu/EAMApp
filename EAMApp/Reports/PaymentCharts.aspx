<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="PaymentCharts.aspx.cs" Inherits="EAMApp.Reports.PaymentCharts" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:UpdatePanel runat="server">
        <ContentTemplate>
             <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" SelectedIndex="0" AutoPostBack="true">
                <Tabs>
                    <telerik:RadTab runat="server" Text="Montlhly Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Montlhly Chart By Frequency" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Montlhly Chart By PayMode" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Yearly Column Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Aggregate Line Chart" >
                    </telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Aggregate Column Chart" >
                    </telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>
            <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0" RenderSelectedPageOnly="true">
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Reports/MonthlyColumnChart.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Reports/MonthlyChartByFrequency.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Reports/MonthlyChartByPayMode.aspx"></telerik:RadPageView>
                 <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Reports/YearlyColumnChart.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Reports/MonthlyLineChartPerYear.aspx"></telerik:RadPageView>
                <telerik:RadPageView runat="server" Height="800px" ContentUrl="/Reports/MonthlyColumChartPerYear.aspx"></telerik:RadPageView>
            </telerik:RadMultiPage>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
