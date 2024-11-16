enum TorrentFilter {
  all('All'),
  stopped('Stopped'),
  verifyQueued('Verify Queued'),
  verifying('Verifying'),
  downloadQueued('Download Queued'),
  downloading('Downloading'),
  seedingQueued('Seeding Queued'),
  seeding('Seeding');

  final String label;

  const TorrentFilter(this.label);
}
