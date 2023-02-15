# shPAGETTI

This package provides pomodoro timer with time tracking functionality in terminal.
All events are logged into *.log.md files separated by days. Entries are formatted in markdown to make them berret readable with naked eye.
You can also simply make a 

When you finish early with the task you can write down what was the reason of premature finish.

## Dependencies

### Mac OS
```bash
$ brew install terminal-notifier
$ brew install caarlos0/tap/timer
```

### Linux
```bash
$ echo 'deb [trusted=yes] https://repo.caarlos0.dev/apt/ /' | sudo tee /etc/apt/sources.list.d/caarlos0.list
$ sudo apt update
$ sudo apt install timer
$ sudo apt install notify-send
```
