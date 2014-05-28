<<<<<<< HEAD
# A sample Python project

![Python Logo](https://www.python.org/static/community_logos/python-logo.png "Sample inline image")

A sample project that exists as an aid to the [Python Packaging User
Guide][packaging guide]'s [Tutorial on Packaging and Distributing
Projects][distribution tutorial].

This project does not aim to cover best practices for Python project
development as a whole. For example, it does not provide guidance or tool
recommendations for version control, documentation, or testing.

[The source for this project is available here][src].

The metadata for a Python project is defined in the `pyproject.toml` file,
an example of which is included in this project. You should edit this file
accordingly to adapt this sample project to your needs.

----

This is the README file for the project.

The file should use UTF-8 encoding and can be written using
[reStructuredText][rst] or [markdown][md use] with the appropriate [key set][md
use]. It will be used to generate the project webpage on PyPI and will be
displayed as the project homepage on common code-hosting services, and should be
written for that purpose.

Typical contents for this file would include an overview of the project, basic
usage examples, etc. Generally, including the project changelog in here is not a
good idea, although a simple “What's New” section for the most recent version
may be appropriate.

[packaging guide]: https://packaging.python.org
[distribution tutorial]: https://packaging.python.org/tutorials/packaging-projects/
[src]: https://github.com/pypa/sampleproject
[rst]: http://docutils.sourceforge.net/rst.html
[md]: https://tools.ietf.org/html/rfc7764#section-3.5 "CommonMark variant"
[md use]: https://packaging.python.org/specifications/core-metadata/#description-content-type-optional
=======
GIT-CRYPT
=========

git-crypt enables transparent encryption and decryption of files in a
git repository.  Files which you choose to protect are encrypted when
committed, and decrypted when checked out.  git-crypt lets you freely
share a repository containing a mix of public and private content.
git-crypt gracefully degrades, so developers without the secret key can
still clone and commit to a repository with encrypted files.  This lets
you store your secret material (such as keys or passwords) in the same
repository as your code, without requiring you to lock down your entire
repository.

git-crypt was written by Andrew Ayer <agwa at andrewayer dot name>.
For more information, see <http://www.agwa.name/projects/git-crypt>.


Building git-crypt
------------------
See the [INSTALL.md](INSTALL.md) file.


Using git-crypt
---------------

Generate a secret key:

    git-crypt keygen /path/to/keyfile

Configure a repository to use encryption:

    cd repo
    git-crypt init /path/to/keyfile

Specify files to encrypt by creating a .gitattributes file:

    secretfile filter=git-crypt diff=git-crypt
    *.key filter=git-crypt diff=git-crypt

Like a .gitignore file, it can match wildcards and should be checked
into the repository.  Make sure you don't accidentally encrypt the
.gitattributes file itself!

Cloning a repository with encrypted files:

    git clone /path/to/repo
    cd repo
    git-crypt init /path/to/keyfile

That's all you need to do - after running `git-crypt init`, you can use
git normally - encryption and decryption happen transparently.


Current Status
--------------

The latest version of git-crypt is [0.3](NEWS.md), released on 2013-04-05.
git-crypt aims to be bug-free and reliable, meaning it shouldn't
crash, malfunction, or expose your confidential data.  However,
it has not yet reached maturity, meaning it is not as documented,
featureful, or easy-to-use as it should be.  Additionally, there may be
backwards-incompatible changes introduced before version 1.0.

Development on git-crypt is currently focused on improving the user
experience, especially around setting up repositories.  There are also
plans to add additional key management schemes, such as passphrase-derived
keys and keys encrypted with PGP.


Security
--------

git-crypt is more secure that other transparent git encryption systems.
git-crypt encrypts files using AES-256 in CTR mode with a synthetic IV
derived from the SHA-1 HMAC of the file.  This is provably semantically
secure under deterministic chosen-plaintext attack.  That means that
although the encryption is deterministic (which is required so git can
distinguish when a file has and hasn't changed), it leaks no information
beyond whether two files are identical or not.  Other proposals for
transparent git encryption use ECB or CBC with a fixed IV.  These systems
are not semantically secure and leak information.

The AES key is stored unencrypted on disk.  The user is responsible for
protecting it and ensuring it's safely distributed only to authorized
people.  A future version of git-crypt may support encrypting the key
with a passphrase.


Limitations
-----------

git-crypt is not designed to encrypt an entire repository.  Not only does
that defeat the aim of git-crypt, which is the ability to selectively
encrypt files and share the repository with less-trusted developers, there
are probably better, more efficient ways to encrypt an entire repository,
such as by storing it on an encrypted filesystem.  Also note that
git-crypt is somewhat of an abuse of git's smudge, clean, and textconv
features.  Junio Hamano, git's maintainer, has said not to do this
<http://thread.gmane.org/gmane.comp.version-control.git/113124/focus=113221>,
though his main objection ("making a pair of similar 'smudged' contents
totally dissimilar in their 'clean' counterparts.") does not apply here
since git-crypt uses deterministic encryption.

git-crypt does not itself provide any authentication.  It assumes that
either the master copy of your repository is stored securely, or that
you are using git's existing facilities to ensure integrity (signed tags,
remembering commit hashes, etc.).


MAILING LISTS

To stay abreast of, and provide input to, git-crypt development, consider
subscribing to one or both of our mailing lists:

Announcements: http://lists.cloudmutt.com/mailman/listinfo/git-crypt-announce
Discussion:    http://lists.cloudmutt.com/mailman/listinfo/git-crypt-discuss
