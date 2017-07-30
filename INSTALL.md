# Installing Cortex GNAT RTS #

* [General](#general)
* [Compiler compatibility](#compatibility)
* [Target](#target)
* [Run time system](#rts)
  * [In `$lib`:](#in-lib)
  * [In `$prefix/arm-eabi/lib/gnat`:](#with-compiler)
  * [In the build location:](#in-build)
* [Link map file](#link-map)

## General <a name="general"/> ##

The runtimes are supplied unbuilt. In order to build them, run `make
all` at the top level (or, if you only want one runtime, run `make` in
that runtime's subdirectory).

You should always use gprbuild and a GNAT Project (GPR) to do
cross-builds. Gnatmake (`arm-eabi-gnatmake`) doesn't work nearly so
well, if at all.

* For GPS, in _Build>Settings>Targets_, in the _File_ tab change
  `gnatmake` and `builder` to `gprbuild`.

* for Emacs ada-mode, in the Ada Build group,
  * set _Ada Build Check Cmd_ to `gprbuild -p -P${gpr_file} -c -u -f
    ${full_current}`
  * set _Ada Build Make Cmd_ to `gprbuild -p -P${gpr_file}`

## Compiler compatibility <a name="compatibility"/> ##

During compiler development, the interface between the compiler and
the run time system it's generating code for changes. As released,
these RTSs match the FSF GCC 7 compiler.

If you're using a release, alternate versions of the affected units,
all in `common`, are provided; in the table below, 'copy over
corresponding `.ad[bs]`' means that, for example, `s-tarest.ads-gcc6`
should be copied over `s-tarest.ads`.

<!-- This renders OK at Github, but not with Markdown.pl. -->

| Compiler | copy over corresponding `.ad[bs]` |
| ---------|----------------------------------- |
| FSF GCC 6 | `environment_task.adb-gcc6`, `s-tarest.adb-gcc6`, `s-tarest.ads-gcc6` |
| GNAT GPL 2016 | as FSF GCC 6 |
| FSF GCC 8 | `a-tags.adb-gcc8`, `a-tags.ads-gcc8` |
| GNAT GPL 2017 | as FSF GCC 8 |

If, instead, you've cloned the repository, then FSF GCC 6 and GNAT GPL
2016 are supported on branch `gcc6`, while FSF GCC 8 and GNAT GPL 2017
are supported on branch `gcc8`.

## Target <a name="target"/> ##

You need to specify the target (`arm-eabi`). If you're only going to
use the command line, you can specify `--target=arm-eabi` on the
command line or in the GPR project-level attribute `Target`:

    for Target use "arm-eabi";

If you're going to use GPS or Emacs ada-mode, use the `Target` attribute.

## Run time system <a name="rts"/> ##

The GNAT compiler running under `gprbuild` can find RTSs in various
ways. An RTS usually contains an `adainclude/` directory with the
source of the RTS and an `adalib/` directory with the corresponding
library, linker script and `.ali` files (these defaults can be changed
by listing the source directory, or colon-separated directories, in
`ada_source_path`, and the object directory in `ada_object_path`).

If not the default, the RTS can be named on the command using a
`--RTS=` option. In a GPR, you can do this in package `Builder` (so
it's applied during all phases of the build):

    package Builder is
       for Default_Switches ("ada") use
         (
          "-g",
          "-O0",
          "--RTS=stm32f429i"
         );
    end Builder;

or, with GPRBUILD GPL 2015 or later, via an attribute:

    for Runtime ("ada") use "stm32f429i";

There are two places where RTSs can be installed:

* in the location indicated by the directory part of `arm-eabi-gcc
  -print-libgcc-file-name`; for GNAT GPL 2015, that would be
  `$prefix/lib/gcc/arm-eabi/4.9.3/`, referred to from here on as
  `$lib`.

* in `$prefix/arm-eabi/lib/gnat`.

You can also work with an RTS in its build location.

### In `$lib`: <a name="in-lib"/> ###

The directory containing the RTS should be called `rts-{name}`, for
example `rts-stm32f429i`.

If the RTS is named `stm32f429i`, the compiler will treat it as the
default RTS (and you need a default RTS) if

* `$lib/rts-stm32f429i` contains text files `ada_object_path`,
  `ada_source_path` containing the locations of the `adalib` and
  `adainclude` directories of the RTS respectively, and there are
  files `adainclude/system.ads` and there is at least one `.ali` file
  in `adalib/`; or

* `$lib/rts-stm32f429i` contains symbolic links named `adalib` and
  `adainclude` to the `adalib/` and `adainclude/` directories of the
  RTS respectively.

Alternative RTSs are found here if they are in directories named
`rts-{name}`, for example `rts-stm32f429i/` corresponds to
`--RTS=stm32f429i`.

### In `$prefix/arm-eabi/lib/gnat`: <a name="with-compiler"/> ###

The directory containing the RTS is just called {name},
e.g. `stm32f429i/`. This is the best place.

### In the build location: <a name="in-build"/> ###

RTSs can also be located by giving the explicit path in the `Runtime
("ada")` attribute or the `--RTS=` option (this has to be an absolute
path with GPRBUILD GPL 2015):

    package Builder is
       for Default_Switches ("ada") use
         (
          "-g",
          "-O0",
          "--RTS=“ & Project’Project_Dir & "../stm32f429i"
         );
    end Builder;

or

    for Runtime ("ada") use Project’Project_Dir & "../stm32f429i";

## Link map file <a name="link-map"/> ##

It can be very useful indeed to have a link map file. In case gprbuild
doesn't support `--create-map-file` with a cross-compiler, a good way to
specify this is in package `Linker` in the GPR:

    package Linker is
       for Default_Switches ("ada") use
         (
          "-Wl,-Map," & Project'Project_Dir & Project'Name & ".map"
          );
    end Linker;

Note the use of `Project'Project_Dir` and `Project'Name`; the first is
especially useful because the linker `arm-eabi-ld` runs in the GPR's
Object_Dir, which is often a subdirectory of the project directory.
