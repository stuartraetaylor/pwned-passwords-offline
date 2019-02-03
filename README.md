# pwned.sh

A bash script to check for [Pwned Passwords](https://haveibeenpwned.com/Passwords) offline 
using the [downloadable pwned passwords list](https://haveibeenpwned.com/Passwords).


## Usage

1. Download [pwned-passwords-sha1-ordered-by-count-v4.7z.torrent](https://downloads.pwnedpasswords.com/passwords/pwned-passwords-sha1-ordered-by-count-v4.7z.torrent) (torrent), or use an [alternative download link](https://haveibeenpwned.com/Passwords).

2. Extract pwned-passwords-sha1-ordered-by-hash-v4.7z

        7z e pwned-passwords-sha1-ordered-by-hash-v4.7z

3. Run pwned.sh

        chmod +x pwned.sh
        ./pwned.sh


## License

[MIT License](LICENSE)

