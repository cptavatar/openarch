#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(xml data)},
    begin_cat: begin of a category                  {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    #          COMMAND                 LABEL                ICON
    {item => ['xdg-open .',        'File Manager',      'system-file-manager']},
    {item => ['terminator',             'Terminal',          'utilities-terminal']},
    {item => ['xdg-open http://',  'Web Browser',       'internet-web-browser']},
    {item => ['bashrun',             'Run command',       'system-run']},

    {sep => 'Categories'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},

    #{cat => ['qt',          'QT Applications',    'qt4logo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},

    #                  LABEL          ICON
    #{begin_cat => ['My category',  'cat-icon']},
    #             ... some items ...
    #{end_cat   => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'openbox']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {begin_cat => ['Advanced Settings', 'gnome-settings']},

        # Configuration files
        {item => ["$editor ~/.conkyrc",              'Conky RC',    'text-x-source']},
        {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Panel', 'text-x-source']},

        # obmenu-generator category
        {begin_cat => ['Obmenu-Generator', 'menu-editor']},
            {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-source']},
            {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-source']},

            {sep  => undef},
            {item => ['obmenu-generator -p',       'Generate a pipe menu',              'menu-editor']},
            {item => ['obmenu-generator -s -c',    'Generate a static menu',            'menu-editor']},
            {item => ['obmenu-generator -p -i',    'Generate a pipe menu with icons',   'menu-editor']},
            {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons', 'menu-editor']},
            {sep  => undef},

            {item => ['obmenu-generator -d', 'Refresh Icon Set', 'gtk-refresh']},
        {end_cat => undef},

        # Openbox category
        {begin_cat => ['Openbox', 'openbox']},
            {item => ['openbox --reconfigure',               'Reconfigure Openbox', 'openbox']},
            {item => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'shellscript']},
            {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-xml']},
            {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-xml']},
        {end_cat => undef},

    {end_cat => undef},
    {sep => undef},
    # Exit category
    {begin_cat => ['Leave', 'leave']},
      #          COMMAND                 LABEL                ICON
      {exit => ['Exit', 'exit']},
      {item => ['systemctl poweroff',  'Shutdown',      'system-shutdown']},
      {item => ['systemctl reboot',    'Restart',       'system-reboot']},
      {item => ['xscreensaver-command -lock', 'Lock', 'lock']},
    {end_cat => undef},
    ## The xscreensaver lock command


    ## This option uses the default Openbox's action "Exit"


    ## This uses the 'oblogout' menu
    # {item => ['oblogout', 'Exit', 'exit']},
]
