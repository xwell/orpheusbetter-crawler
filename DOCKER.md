# Docker Setup for OrpheusBetter

## Create Folders:

```text
mkdir config data torrent
```

## Build the Image:

```text
docker build -t orpheusbetter .
```

## Run the Container:

```text
docker run -it -v $PWD/config:/config/.orpheusbetter -v $PWD/data:/data -v $PWD/torrent:/torrent orpheusbetter -c "/app/orpheusbetter --threads 4"
```

## Additioal Arugments for the Container:

```text
usage: orpheusbetter [-h] [-s] [-j THREADS] [--config CONFIG] [--cache CACHE]
                     [-U] [-E] [--version] [-m MODE] [-S] [-t TOTP]
                     [-o SOURCE]
                     [release_urls [release_urls ...]]

positional arguments:
  release_urls          the URL where the release is located (default: None)

optional arguments:
  -h, --help            show this help message and exit
  -s, --single          only add one format per release (useful for getting
                        unique groups) (default: False)
  -j THREADS, --threads THREADS
                        number of threads to use when transcoding (default: 7)
  --config CONFIG       the location of the configuration file (default:
                        ~/.orpheusbetter/config)
  --cache CACHE         the location of the cache (default:
                        ~/.orpheusbetter/cache)
  -U, --no-upload       don't upload new torrents (in case you want to do it
                        manually) (default: False)
  -E, --no-24bit-edit   don't try to edit 24-bit torrents mistakenly labeled
                        as 16-bit (default: False)
  --version             show program's version number and exit
  -m MODE, --mode MODE  mode to search for transcode candidates; snatched,
                        uploaded, both, seeding, or all (default: None)
  -S, --skip            treats a torrent as already processed (default: False)
  -t TOTP, --totp TOTP  time based one time password for 2FA (default: None)
  -o SOURCE, --source SOURCE
                        the value to put in the source flag in created
                        torrents (default: None)
```

## FAQ:

#### I have 2FA enabled, how do i input my code?

Add ```--totp codehere``` in the docker run command option.

```text
docker run -it -v $PWD/config:/config/.orpheusbetter -v $PWD/data:/data -v $PWD/torrent:/torrent orpheusbetter -c "/app/orpheusbetter --threads 4 --totp codehere"
```

#### I just want to test the app, how do I do it without uploading?

Add ```--no-upload``` in the docker run command option.

```text
docker run -it -v $PWD/config:/config/.orpheusbetter -v $PWD/data:/data -v $PWD/torrent:/torrent orpheusbetter -c "/app/orpheusbetter --threads 4 --no-upload"
```
#### OrpheusBetter isn't showing me any results after running it various times.

Head into the config folder and delete the file named ```cache```.
