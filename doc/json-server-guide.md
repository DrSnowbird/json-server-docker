# Json-server Usage Guide
```
json-server [options] <source>

Options:
  --config, -c               Path to config file   [default: "json-server.json"]
  --port, -p                 Set port                            [default: 3000]
  --host, -H                 Set host                     [default: "localhost"]
  --watch, -w                Watch file(s)                             [boolean]
  --routes, -r               Path to routes file
  --middlewares, -m          Paths to middleware files                   [array]
  --static, -s               Set static files directory
  --read-only, --ro          Allow only GET requests                   [boolean]
  --no-cors, --nc            Disable Cross-Origin Resource Sharing     [boolean]
  --no-gzip, --ng            Disable GZIP Content-Encoding             [boolean]
  --snapshots, -S            Set snapshots directory              [default: "."]
  --delay, -d                Add delay to responses (ms)
  --id, -i                   Set database id property (e.g. _id) [default: "id"]
  --foreignKeySuffix, --fks  Set foreign key suffix (e.g. _id as in post_id)
                                                                 [default: "Id"]
  --quiet, -q                Suppress log messages from output         [boolean]
  --help, -h                 Show help                                 [boolean]
  --version, -v              Show version number                       [boolean]

Examples:
  json-server db.json
  json-server file.js
  json-server http://example.com/db.json

https://github.com/typicode/json-server

┌─────────────────────────────────────────────────────────────┐
│               json-server update check failed               │
│             Try running with sudo or get access             │
│            to the local update config store via             │
│ sudo chown -R $USER:$(id -gn $USER) /home/developer/.config │
└─────────────────────────────────────────────────────────────┘
```
