import 'package:audioplayers/audioplayers.dart';
import 'package:ureport_ecaro/utils/sp_utils.dart';

class ClickSound {
  static soundClick() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_click.mp3'));
    }
  }

  static soundClose() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_close.mp3'));
    }
  }

  static soundDropdown() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_dropdown.wav'));
    }
  }

  static soundMsgReceived() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_msg_received.mp3'));
    }
  }

  static soundMsgSend() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_msg_send.mp3'));
    }
  }

  static soundTyping() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_msg_typing.mp3'));
    }
  }

  static soundShare() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_share.mp3'));
    }
  }

  static soundTap() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/v2_click.mp3'));
    }
  }

  static soundNoInternet() {
    if (SPUtil().getValue(SPUtil.SOUND) == "true") {
      final player = AudioPlayer();

      player.play(AssetSource('audio/no_internet_alert.mp3'));
    }
  }
}
