part of nyxx;

/// Emitted when client connects/disconnects/mutes etc to voice channel
class VoiceStateUpdateEvent {
  /// Voices state
  VoiceState state;

  Map<String, dynamic> json;

  VoiceStateUpdateEvent._new(Client client, this.json) {
    this.state = new VoiceState._new(client, json['d'] as Map<String, dynamic>);

    if (state.user != null) client._voiceStates[state.user.id] = state;

    client._events.onVoiceStateUpdate.add(this);
  }
}
