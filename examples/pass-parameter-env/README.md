# Docker run example

Passing a parameter to a running container via an environment variable.

Open a terminal and type 

```bash
./run.sh
```

Note that for this simple task, we don't follow all rules and use an image tagged `latest`.

Your output should be similar to the following example execution:

```bash
daniel@nuest ~/git/ten-simple-rules-dockerfiles/examples/pass-parameter-env [master]$ ./run.sh 
> l = length(readLines(Sys.getenv('CONFIG_PARAM'))); print(paste('Number of lines: ', l))
[1] "Number of lines:  833"
> 
```
