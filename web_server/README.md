# Web Server - File Transfer

This directory contains the script for transferring files to a server via SCP.

## 0-transfer_file

A Bash script that transfers a file from the client to a server using `scp`.

### Usage

```bash
./0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY
```

### Parameters

1. **PATH_TO_FILE** - The path to the file to be transferred
2. **IP** - The IP of the server to transfer the file to
3. **USERNAME** - The username scp connects with
4. **PATH_TO_SSH_KEY** - The path to the SSH private key that scp uses

### Requirements

- Accepts exactly 4 parameters
- Displays usage message if less than 4 parameters are provided:
  `Usage: 0-transfer_file PATH_TO_FILE IP USERNAME PATH_TO_SSH_KEY`
- Uses `scp` with the private key `-i` flag
- Disables strict host key checking with `-o StrictHostKeyChecking=no`
- Transfers the file to the user's home directory `~/`

### Example

```bash
./0-transfer_file some_page.html 8.8.8.8 sylvain /vagrant/private_key
```

This will transfer `some_page.html` to `ubuntu@8.8.8.8:/home/ubuntu/`.
```