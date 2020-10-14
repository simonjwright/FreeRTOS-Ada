# Installing and using Cortex GNAT RTS #

## Installing ##

The runtimes are supplied unbuilt. In order to build them, some scenario variables need to be set.

### FreeRTOS ###

The compiler has to find the FreeRTOS sources.

| Variable | Use | Default |
| ---------|-----|-------- |
| `FREERTOS_PARENT` | where FreeRTOS is installed | `HOME` |
| `FREERTOS_RELEASE` | version | `FreeRTOSv10.0.1` |

### Compiler release ###

During compiler development, the interface between the compiler and the run time system it's generating code for changes.

| Variable | Default |
| ---------|-------- |
| `RELEASE` | gcc8 |

Values for `RELEASE` are as below:

| Compiler | `RELEASE=` |
| ---------|------------ |
| FSF GCC 6 | `gcc6` |
| FSF GCC 7 | `gcc7` |
| FSF GCC 8 | `gcc8` |
| FSF GCC 9 | `gcc8` |
| GNAT GPL 2016 | `gcc6` |
| GNAT GPL 2017 | `gnat-gpl-2017` |
| GNAT CE 2018 | `gcc8` |
| GNAT CE 2019 | `gcc8` |
| GNAT CE 2020 | `gnat-ce-2020` |

Build by running
<tt>make&nbsp;RELEASE=<i>release</i>&nbsp;all</tt> at the top level (or, if you only want one runtime, by <tt>make&nbsp;RELEASE=<i>release</i></tt> in that runtime's subdirectory).

## Installation ##

The runtimes must be installed. To install the runtime(s) with your compiler (you may need to use `sudo`),

<pre>
make RELEASE=<i>release</i> install
</pre>

either at top level for all runtimes, or in the individual runtime's subdirectory.

### Local installation ###

It used to be possible to use a runtime from its build directory (for example, `--RTS=$HOME/cortex-gnat-rts/stm32f4`), but this isn't possible with the new multi-release structure. Instead, the runtimes must be installed locally.

| Variable | Default |
| ---------|-------- |
| `INSTALL_LOCALLY` | `yes` |

<pre>
make RELEASE=<i>release</i> INSTALL_LOCALLY=yes install
</pre>

allowing `--RTS=$HOME/cortex-gnat-rts/local/stm32f4`.

## Using ##

You should always use `gprbuild` and a GNAT Project (GPR) to do cross-builds. Gnatmake (`arm-eabi-gnatmake`) doesn't work nearly so well, if at all.

* For GPS, in _Build>Settings>Targets_, in the _File_ tab change `gnatmake` and `builder` to `gprbuild`.

* for Emacs ada-mode, in the Ada Build group,
  * set _Ada Build Check Cmd_ to `gprbuild -p -P${gpr_file} -c -u -f ${full_current}`
  * set _Ada Build Make Cmd_ to `gprbuild -p -P${gpr_file}`

### Target ###

You need to specify the target (`arm-eabi`). If you're only going to use the command line, you can specify `--target=arm-eabi` on the command line, or in a GPR using the project-level attribute `Target`:

    for Target use "arm-eabi";

If you're going to use GPS or Emacs ada-mode, use the `Target` attribute.

### Run time system ###

To use an RTS installed with the compiler, for example `stm32f4`, you can specify it on the command line, using `--RTS=stm32f4`, or with a recent `gprbuild` in the project file:

    for Runtime ("ada") use "stm32f4";

If using a locally-installed RTS, use a relative or absolute path:

    for Runtime ("ada")
      use Project’Project_Dir & "../local/stm32f4";
