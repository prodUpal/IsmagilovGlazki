﻿#pragma checksum "..\..\AgentPage.xaml" "{8829d00f-11b8-4213-878b-770e8597ac16}" "032C71FF62FCB352811D56A56E0C515D6AB95C924D536D8C445189A5F53173A5"
//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан программой.
//     Исполняемая версия:4.0.30319.42000
//
//     Изменения в этом файле могут привести к неправильной работе и будут потеряны в случае
//     повторной генерации кода.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Diagnostics;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Effects;
using System.Windows.Media.Imaging;
using System.Windows.Media.Media3D;
using System.Windows.Media.TextFormatting;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Windows.Shell;
using glazki_ismagilov;


namespace glazki_ismagilov {
    
    
    /// <summary>
    /// AgentPage
    /// </summary>
    public partial class AgentPage : System.Windows.Controls.Page, System.Windows.Markup.IComponentConnector {
        
        
        #line 19 "..\..\AgentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.TextBox TBSearch;
        
        #line default
        #line hidden
        
        
        #line 20 "..\..\AgentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox SortCombo;
        
        #line default
        #line hidden
        
        
        #line 26 "..\..\AgentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ComboBox TypeCombo;
        
        #line default
        #line hidden
        
        
        #line 36 "..\..\AgentPage.xaml"
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1823:AvoidUnusedPrivateFields")]
        internal System.Windows.Controls.ListView AgentListView;
        
        #line default
        #line hidden
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Uri resourceLocater = new System.Uri("/glazki_ismagilov;component/agentpage.xaml", System.UriKind.Relative);
            
            #line 1 "..\..\AgentPage.xaml"
            System.Windows.Application.LoadComponent(this, resourceLocater);
            
            #line default
            #line hidden
        }
        
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        [System.CodeDom.Compiler.GeneratedCodeAttribute("PresentationBuildTasks", "4.0.0.0")]
        [System.ComponentModel.EditorBrowsableAttribute(System.ComponentModel.EditorBrowsableState.Never)]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Design", "CA1033:InterfaceMethodsShouldBeCallableByChildTypes")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Maintainability", "CA1502:AvoidExcessiveComplexity")]
        [System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1800:DoNotCastUnnecessarily")]
        void System.Windows.Markup.IComponentConnector.Connect(int connectionId, object target) {
            switch (connectionId)
            {
            case 1:
            this.TBSearch = ((System.Windows.Controls.TextBox)(target));
            
            #line 19 "..\..\AgentPage.xaml"
            this.TBSearch.TextChanged += new System.Windows.Controls.TextChangedEventHandler(this.TBSearch_TextChanged);
            
            #line default
            #line hidden
            return;
            case 2:
            this.SortCombo = ((System.Windows.Controls.ComboBox)(target));
            
            #line 20 "..\..\AgentPage.xaml"
            this.SortCombo.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.SortCombo_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 3:
            this.TypeCombo = ((System.Windows.Controls.ComboBox)(target));
            
            #line 26 "..\..\AgentPage.xaml"
            this.TypeCombo.SelectionChanged += new System.Windows.Controls.SelectionChangedEventHandler(this.TypeCombo_SelectionChanged);
            
            #line default
            #line hidden
            return;
            case 4:
            this.AgentListView = ((System.Windows.Controls.ListView)(target));
            return;
            }
            this._contentLoaded = true;
        }
    }
}
