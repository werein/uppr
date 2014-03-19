# Uppr

Uploader for Rails using CarrierWave uploader and support for image, video and attachment.

## Installation

* Add this line to your application's Gemfile

```ruby
gem 'uppr'
```

* Load it in `lib/your_engine/engine.rb` if is used in engine

```ruby
require 'uppr'
```

## Usage

Mount uploader to your model. Uploader supports images, videos and files.

* Uppr::Image
* Uppr::Video
* Uppr::Attachment

#####Example

```ruby
mount_uploader :image, Uppr::Image
mount_uploader :video, Uppr::Video
mount_uploader :attachment, Uppr::Attachment
```

It supports background uploading. If you want to upload on background, you need to have `attribute_tmp` in your database table.

#####Example

```ruby
store_in_background :image
store_in_background :video
store_in_background :attachment
```

### Image versions
* `original` 1920px x auto
* `original.thumb` 720px x auto
* `square` 1920px x 1920px
* `square.thumb` 720px x 720px
* `portrait` 1080 x 1920px
* `portrait.thumb` 720px x 1280px
* `landscape` 1920px x 1080px
* `landscape.thumb` 1280px x 720px

### Video versions
* `mp4` - original resolution in Apple format
* `mp4.p1080` - 1080p
* `mp4.p720` - 720p
* `ogv` - original resolution in Firefox format
* `ogv.p1080` - 1080p
* `ogv.p720` - 720p
* `webm` - original resolution in Google format
* `webm.p1080` - 1080p
* `webm.p720` - 720p

### Allowed attachments
* zip
* rar
* pdf
* doc