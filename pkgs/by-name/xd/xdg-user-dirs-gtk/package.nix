{
  stdenv,
  lib,
  fetchurl,
  intltool,
  pkg-config,
  xdg-user-dirs,
  wrapGAppsHook3,
  gtk3,
  gnome,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "xdg-user-dirs-gtk";
  version = "0.11";

  src = fetchurl {
    url = "mirror://gnome/sources/xdg-user-dirs-gtk/${lib.versions.majorMinor finalAttrs.version}/xdg-user-dirs-gtk-${finalAttrs.version}.tar.xz";
    hash = "sha256-U0vVY9PA4/jcvzV4y4qw5J07pByWbUd8ivlDg2QSHn0=";
  };

  nativeBuildInputs = [
    intltool
    pkg-config
    xdg-user-dirs # for AC_PATH_PROG
    wrapGAppsHook3
  ];

  buildInputs = [ gtk3 ];

  postPatch = ''
    # Fetch translations from correct localedir.
    substituteInPlace update.c --replace-fail \
      'bindtextdomain ("xdg-user-dirs", GLIBLOCALEDIR);' \
      'bindtextdomain ("xdg-user-dirs", "${xdg-user-dirs}/share/locale");'
  '';

  preFixup = ''
    gappsWrapperArgs+=(--prefix PATH : "${lib.makeBinPath [ xdg-user-dirs ]}")
  '';

  passthru.updateScript = gnome.updateScript {
    packageName = "xdg-user-dirs-gtk";
  };

  meta = {
    homepage = "https://gitlab.gnome.org/GNOME/xdg-user-dirs-gtk";
    description = "companion to xdg-user-dirs that integrates it into the GNOME desktop and GTK applications";
    license = lib.licenses.gpl2Only;
    maintainers = lib.teams.gnome.members;
    platforms = lib.platforms.unix;
    mainProgram = "xdg-user-dirs-gtk-update";
  };
})
