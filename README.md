# sampshell
My customization to ZSH

# Notes
the `.zsh{env,rc}` files are where config are setup; the `interactive/*` is just where comands/aliases are registered.

# Fun things

Some fun thigns:
- you can overload `~[foo]` via the `zsh_directory_name` function
- `cat =(<<<foo)` --- TODO: what does NULLCMD do?
- `$ <file` just passes it to `more` (Technically READNULLCMD)

- `print -zr – $ZLE_LINE_ABORTED` is the previous line
- you can `disown` jobs to not have the shell interact with them anymore. also `&|` at teh end does it.

how does fignore work?
--
HISTORY_IGNORE

    If set, is treated as a pattern at the time history files are written. Any potential history entry that matches the pattern is skipped. For example, if the value is ‘fc *’ then commands that invoke the interactive history editor are never written to the history file.

    Note that HISTORY_IGNORE defines a single pattern: to specify alternatives use the ‘(first|second|...)’ syntax.

    Compare the HIST_NO_STORE option or the zshaddhistory hook, either of which would prevent such commands from being added to the interactive history at all. If you wish to use HISTORY_IGNORE to stop history being added in the first place, you can define the following hook:

    zshaddhistory() {
      emulate -L zsh
      ## uncomment if HISTORY_IGNORE
      ## should use EXTENDED_GLOB syntax
      # setopt extendedglob
      [[ $1 != ${~HISTORY_IGNORE} ]]
    }

 LISTMAX

    In the line editor, the number of matches to list without asking first. If the value is negative, the list will be shown if it spans at most as many lines as given by the absolute value. If set to zero, the shell asks only if the top of the listing would scroll off the screen. 



PROMPT_EOL_MARK

    When the PROMPT_CR and PROMPT_SP options are set, the PROMPT_EOL_MARK parameter can be used to customize how the end of partial lines are shown. This parameter undergoes prompt expansion, with the PROMPT_PERCENT option set. If not set, the default behavior is equivalent to the value ‘%B%S%#%s%b’. 


TIMEFMT

    The format of process time reports with the time keyword. The default is ‘%J %U user %S system %P cpu %*E total’. Recognizes the following escape sequences, although not all may be available on all systems, and some that are available may not be useful:

    %%

        A ‘%’. 
    %U

        CPU seconds spent in user mode. 
    %S

        CPU seconds spent in kernel mode. 
    %E

        Elapsed time in seconds. 
    %P

        The CPU percentage, computed as 100*(%U+%S)/%E. 
    %W

        Number of times the process was swapped. 
    %X

        The average amount in (shared) text space used in kilobytes. 
    %D

        The average amount in (unshared) data/stack space used in kilobytes. 
    %K

        The total space used (%X+%D) in kilobytes. 
    %M

        The maximum memory the process had in use at any time in kilobytes. 
    %F

        The number of major page faults (page needed to be brought from disk). 
    %R

        The number of minor page faults. 
    %I

        The number of input operations. 
    %O

        The number of output operations. 
    %r

        The number of socket messages received. 
    %s

        The number of socket messages sent. 
    %k

        The number of signals received. 
    %w

        Number of voluntary context switches (waits). 
    %c

        Number of involuntary context switches. 
    %J

        The name of this job. 

	A star may be inserted between the percent sign and flags printing time (e.g., ‘%*E’); this causes the time to be printed in ‘hh:mm:ss.ttt’ format (hours and minutes are only printed if they are not zero). Alternatively, ‘m’ or ‘u’ may be used (e.g., ‘%mE’) to produce time output in milliseconds or microseconds, respectively. 

TMPPREFIX

    A pathname prefix which the shell will use for all temporary files. Note that this should include an initial part for the file name as well as any directory names. The default is ‘/tmp/zsh’. 

WORDCHARS <S>

    A list of non-alphanumeric characters considered part of a word by the line editor. 


$pipestatus <S> <Z>

    An array containing the exit statuses returned by all commands in the last pipeline. 

$_ <S>

    The last argument of the previous command. Also, this parameter is set in the environment of every command executed to the full pathname of the command. 


14.8.5 Approximate Matching

When matching approximately, the shell keeps a count of the errors found, which cannot exceed the number specified in the (#anum) flags. Four types of error are recognised:

1.

    Different characters, as in fooxbar and fooybar.
2.

    Transposition of characters, as in banana and abnana.
3.

    A character missing in the target string, as with the pattern road and target string rod.
4.

    An extra character appearing in the target string, as with stove and strove.

Thus, the pattern (#a3)abcd matches dcba, with the errors occurring by using the first rule twice and the second once, grouping the string as [d][cb][a] and [a][bc][d].

Non-literal parts of the pattern must match exactly, including characters in character ranges: hence (#a1)??? matches strings of length four, by applying rule 4 to an empty part of the pattern, but not strings of length two, since all the ? must match. Other characters which must match exactly are initial dots in filenames (unless the GLOB_DOTS option is set), and all slashes in filenames, so that a/bc is two errors from ab/c (the slash cannot be transposed with another character). Similarly, errors are counted separately for non-contiguous strings in the pattern, so that (ab|cd)ef is two errors from aebf.

When using exclusion via the ~ operator, approximate matching is treated entirely separately for the excluded part and must be activated separately. Thus, (#a1)README~READ_ME matches READ.ME but not READ_ME, as the trailing READ_ME is matched without approximation. However, (#a1)README~(#a1)READ_ME does not match any pattern of the form READ?ME as all such forms are now excluded.

Apart from exclusions, there is only one overall error count; however, the maximum errors allowed may be altered locally, and this can be delimited by grouping. For example, (#a1)cat((#a0)dog)fox allows one error in total, which may not occur in the dog section, and the pattern (#a1)cat(#a0)dog(#a1)fox is equivalent. Note that the point at which an error is first found is the crucial one for establishing whether to use approximation; for example, (#a1)abc(#a0)xyz will not match abcdxyz, because the error occurs at the ‘x’, where approximation is turned off.

Entire path segments may be matched approximately, so that ‘(#a1)/foo/d/is/available/at/the/bar’ allows one error in any path segment. This is much less efficient than without the (#a1), however, since every directory in the path must be scanned for a possible approximate match. It is best to place the (#a1) after any path segments which are known to be correct. 



https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html:
-h

    Hide: only useful for special parameters (those marked ‘<S>’ in the table in Parameters Set By The Shell), and for local parameters with the same name as a special parameter, though harmless for others. A special parameter with this attribute will not retain its special effect when made local. Thus after ‘typeset -h PATH’, a function containing ‘typeset PATH’ will create an ordinary local parameter without the usual behaviour of PATH. Alternatively, the local parameter may itself be given this attribute; hence inside a function ‘typeset -h PATH’ creates an ordinary local parameter and the special PATH parameter is not altered in any way. It is also possible to create a local parameter using ‘typeset +h special’, where the local copy of special will retain its special properties regardless of having the -h attribute. Global special parameters loaded from shell modules (currently those in zsh/mapfile and zsh/parameter) are automatically given the -h attribute to avoid name clashes.
-H

    Hide value: specifies that typeset will not display the value of the parameter when listing parameters; the display for such parameters is always as if the ‘+’ flag had been given. Use of the parameter is in other respects normal, and the option does not apply if the parameter is specified by name, or by pattern with the -m option. This is on by default for the parameters in the zsh/parameter and zsh/mapfile modules. Note, however, that unlike the -h flag this is also useful for non-special parameters.
