{ pkgs, ... }: {
  xdg.configFile."vivaldi/css/no-favicon-outline.css".text = ''
    .tab.active .tab-header .favicon:not(.svg) {
      filter: none !important;
    }
  '';

  xdg.dataFile."applications/vivaldi-stable.desktop".text = let
    vivaldiBin = "${pkgs.vivaldi}/bin/vivaldi";
  in ''
    [Desktop Entry]
    Version=1.0
    Name=Vivaldi
    GenericName=Web Browser
    Comment=Access the Internet
    Exec=${vivaldiBin} --disable-features=AllowQt %U
    StartupNotify=true
    Terminal=false
    Icon=vivaldi
    Type=Application
    Categories=Network;WebBrowser;
    MimeType=application/pdf;application/rdf+xml;application/rss+xml;application/xhtml+xml;application/xhtml_xml;application/xml;image/gif;image/jpeg;image/png;image/webp;text/html;text/xml;x-scheme-handler/ftp;x-scheme-handler/http;x-scheme-handler/https;x-scheme-handler/mailto;
    Actions=new-window;new-private-window;

    [Desktop Action new-window]
    Name=New Window
    Exec=${vivaldiBin} --disable-features=AllowQt --new-window

    [Desktop Action new-private-window]
    Name=New Private Window
    Exec=${vivaldiBin} --disable-features=AllowQt --incognito
  '';
}
