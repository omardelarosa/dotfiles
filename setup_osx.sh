# OSX System Setup
#
# These scripts are designed to setup a new mac with my favorite tools.
#
#

# View hidden files
# defaults write com.apple.finder AppleShowAllFiles YES

# Set default mac screenshot directory
# defaults write com.apple.screencapture location ~/Dropbox/Screenshots/;killall SystemUIServer

# Install rvm + ruby
# \curl -sSL https://get.rvm.io | bash -s stable

# Install homebrew
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install favorite brew packages
brew install ack freetds heroku-toolbelt libtiff openssl szip \
  arpack freetype imagemagick libtool pcre tbb \
  autoconf gcc isl libvo-aacenc pkg-config the_silver_searcher \
  automake gd jack libvorbis plotutils tree \
  berkeley-db gdbm jbig2dec libyaml postgresql veclibfort \
  boot2docker geoip jpeg little-cms2 pstoedit vim \
  brew-cask-completion ghostscript lame lua python wget \
  cscope gifsicle leiningen macvim qhull x264 \
  docker gl2ps libgpg-error maven qrupdate xvid \
  elasticsearch glpk libksba mongodb rbenv xz \
  epstool gmp libmpc mpfr readline \
  ffmpeg gnu-sed libogg nginx redis \
  fftw gnuplot libpng ruby-build \
  flac graphicsmagick libsamplerate sqlite \
  fontconfig hdf5 libsndfile octave suite-sparse421 \
