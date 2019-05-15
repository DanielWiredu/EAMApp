<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="vwContributionAggregateGrid.aspx.cs" Inherits="EAMApp.Reports.vwContributionAggregateGrid" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="wrapper wrapper-content animated fadeInRight">
            <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                       <p>Contribution Aggregate</p>
                        
                        <div class="row">
              <telerik:RadGrid ID="contGrid" runat="server" ShowFooter="true" AutoGenerateColumns="true" AllowFilteringByColumn="False" AllowSorting="True" DataSourceID="aggregateSource" GroupPanelPosition="Top" CellSpacing="-1" GridLines="Both">
                                    <ClientSettings>
                                        <Selecting AllowRowSelect="True" />
                                        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
                                         <Resizing AllowColumnResize="true" AllowRowResize="true" />
                                    </ClientSettings>
                                    <GroupingSettings CaseSensitive="false" />
                                    <ExportSettings IgnorePaging="true" ExportOnlyData="true" OpenInNewWindow="true" FileName="contributionSummary" HideStructureColumns="true">
                                    </ExportSettings>
                                    <MasterTableView DataSourceID="aggregateSource">
                                    </MasterTableView>
                                </telerik:RadGrid>
             <asp:SqlDataSource ID="aggregateSource" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="spGetNowPrevYearChart" SelectCommandType="StoredProcedure">
                 <SelectParameters>
                     <asp:QueryStringParameter Name="nowYear" Type="Int32" QueryStringField="yy" />
                     <asp:QueryStringParameter Name="currency" Type="String" QueryStringField="cur" />
                 </SelectParameters>
                </asp:SqlDataSource>
             
                <div class="modal-footer">
                    <asp:Button ID="btnExcelExport" runat="server" Text="Excel" CssClass="btn btn-primary" OnClick="btnExcelExport_Click" CausesValidation="false" />
                </div>
         </div>
                    </div>
                </div>
            </div>
                </div>

         

        </div>
</asp:Content>
