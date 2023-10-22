enum JOINTS {
  Neck, Hip, RightShoulder, LeftShoulder, RightElbow,
    LeftElbow, RightThigh, LeftThigh, RightKnee, LeftKnee,
    BodyX, BodyY,
}
class Motion {
  JSONObject json = loadJSONObject("data.json");
  MotionKeyFrames motionKeyFrames = new MotionKeyFrames();
  Motion() {
    JSONArray gestures = json.getJSONArray("gestures");
    for (int i = 0; i < gestures.size(); i++) {
      JSONArray seqs = gestures.getJSONObject(i).getJSONArray("keyFrames");
      for (var targetJoint : JointNames) {
        motionKeyFrames.Regist(targetJoint, new KeyFrame(0, 0));
      }
      for (int j = 0; j < seqs.size(); j++) {
        JSONObject joints = seqs.getJSONObject(j);
        float t = joints.getFloat("t");
        for (var targetJoint : JointNames) {
          if (joints.hasKey(targetJoint)) {
            motionKeyFrames.Regist(targetJoint, new KeyFrame(t, joints.getFloat(targetJoint)));
          }
        }
      }
    }

    Move(JOINTS.Neck, 0);
  }
  void Move(JOINTS joint, int t) {
    if (joint == JOINTS.BodyX) {
      translate(motionKeyFrames.extractRotation(joint, t), 0);
      return;
    }
    if (joint == JOINTS.BodyY) {
      translate(0, -motionKeyFrames.extractRotation(joint, t));
      return;
    }
    rotate(radians(motionKeyFrames.extractRotation(joint, t)));
  }
}
String[] JointNames = new String[]{"Neck", "Hip", "Right shoulder",
  "Left shoulder", "Right elbow", "Left elbow", "Right thigh",
  "Left thigh", "Right knee", "Left knee", "BodyX", "BodyY"};



class MotionSeqs {
  IntList Neck, Hip, RightShoulder, LeftShoulder, RightElbow, LeftElbow, RightThigh, LeftThigh;
}

class MotionKeyFrames {
  HashMap<JOINTS, ArrayList<KeyFrame>> joints = new HashMap<JOINTS, ArrayList<KeyFrame>>();
  MotionKeyFrames() {
    joints.put(JOINTS.Neck, new ArrayList<KeyFrame>());
    joints.put(JOINTS.Hip, new ArrayList<KeyFrame>());
    joints.put(JOINTS.RightShoulder, new ArrayList<KeyFrame>());
    joints.put(JOINTS.LeftShoulder, new ArrayList<KeyFrame>());
    joints.put(JOINTS.RightElbow, new ArrayList<KeyFrame>());
    joints.put(JOINTS.LeftElbow, new ArrayList<KeyFrame>());
    joints.put(JOINTS.RightThigh, new ArrayList<KeyFrame>());
    joints.put(JOINTS.LeftThigh, new ArrayList<KeyFrame>());
    joints.put(JOINTS.LeftKnee, new ArrayList<KeyFrame>());
    joints.put(JOINTS.RightKnee, new ArrayList<KeyFrame>());

    joints.put(JOINTS.BodyX, new ArrayList<KeyFrame>());
    joints.put(JOINTS.BodyY, new ArrayList<KeyFrame>());
  }

  void Regist(String name, KeyFrame keyframe) {
    switch(name) {
    case "Neck":
      joints.get(JOINTS.Neck).add(keyframe);
      break;
    case "Hip":
      joints.get(JOINTS.Hip).add(keyframe);
      break;
    case "Right shoulder" :
      joints.get(JOINTS.RightShoulder).add(keyframe);
      break;
    case "Left shoulder":
      joints.get(JOINTS.LeftShoulder).add(keyframe);
      break;
    case "Right elbow":
      joints.get(JOINTS.RightElbow).add(keyframe);
      break;
    case "Left elbow":
      joints.get(JOINTS.LeftElbow).add(keyframe);
      break;
    case "Right thigh":
      joints.get(JOINTS.RightThigh).add(keyframe);
      break;
    case "Left thigh":
      joints.get(JOINTS.LeftThigh).add(keyframe);
      break;
    case "Right knee":
      joints.get(JOINTS.RightKnee).add(keyframe);
      break;
    case "Left knee":
      joints.get(JOINTS.LeftKnee).add(keyframe);
      break;
    case "BodyY":
      joints.get(JOINTS.BodyY).add(keyframe);
      break;
    case "BodyX":
      joints.get(JOINTS.BodyX).add(keyframe);
      break;
    }
  }
  float extractRotation(JOINTS joint, float t) {
    ArrayList<KeyFrame> keyframes = joints.get(joint);
    if (keyframes.size() <= 1) {

      return 0;
    }
    int idx = 0;
    KeyFrame former = new KeyFrame(0, 0);
    KeyFrame later =  new KeyFrame(0, 0);
    while (idx < keyframes.size()) {

      former = keyframes.get(idx);
      later = keyframes.get(min(idx + 1, keyframes.size() - 1));

      if (former.t <= t && t < later.t) {
        break;
      }
      idx++;
    }
    if (later.t == former.t) {
      return later.v;
    }
    float m = (later.v - former.v) / (later.t - former.t);
    float y = m * (t - former.t) + former.v;
    println(t,former.t, y);
    return y;
  }
}
class KeyFrame {
  float t;
  float v;
  KeyFrame(float _t, float _v) {
    
    t = _t * (float)frameRate;
    v = _v;
  }
}
