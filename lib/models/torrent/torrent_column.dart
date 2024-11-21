enum TorrentColumn {
  name('Name'),
  size('Size'),
  progress('Progress'),
  status('Status'),
  downloadSpeed('Download Speed'),
  uploadSpeed('Upload Speed'),

  eta('ETA');

  final String label;

  const TorrentColumn(this.label);
}
