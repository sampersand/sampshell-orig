# sampshell
My customization to ZSH

Some fun thigns:
- you can overload `~[foo]` via the `zsh_directory_name` function
- `cat =(<<<foo)` --- TODO: what does NULLCMD do?
- `$ <file` just passes it to `more` (Technically READNULLCMD)

- `print -zr – $ZLE_LINE_ABORTED` is the previous line

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
