#include "pch-c.h"
#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif


#include "codegen/il2cpp-codegen-metadata.h"





#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodExecutionContextInfo g_methodExecutionContextInfos[1] = { { 0, 0, 0 } };
#else
static const Il2CppMethodExecutionContextInfo g_methodExecutionContextInfos[1] = { { 0, 0, 0 } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const char* g_methodExecutionContextInfoStrings[1] = { NULL };
#else
static const char* g_methodExecutionContextInfoStrings[1] = { NULL };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodExecutionContextInfoIndex g_methodExecutionContextInfoIndexes[45] = 
{
	{ 0, 0 } /* 0x06000001 System.Void UnityEngine.AudioSettings::InvokeOnAudioConfigurationChanged(System.Boolean) */,
	{ 0, 0 } /* 0x06000002 System.Void UnityEngine.AudioSettings::InvokeOnAudioSystemShuttingDown() */,
	{ 0, 0 } /* 0x06000003 System.Void UnityEngine.AudioSettings::InvokeOnAudioSystemStartedUp() */,
	{ 0, 0 } /* 0x06000004 System.Boolean UnityEngine.AudioSettings::StartAudioOutput() */,
	{ 0, 0 } /* 0x06000005 System.Boolean UnityEngine.AudioSettings::StopAudioOutput() */,
	{ 0, 0 } /* 0x06000006 System.Void UnityEngine.AudioSettings/AudioConfigurationChangeHandler::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0 } /* 0x06000007 System.Void UnityEngine.AudioSettings/AudioConfigurationChangeHandler::Invoke(System.Boolean) */,
	{ 0, 0 } /* 0x06000008 System.Boolean UnityEngine.AudioSettings/Mobile::get_muteState() */,
	{ 0, 0 } /* 0x06000009 System.Void UnityEngine.AudioSettings/Mobile::set_muteState(System.Boolean) */,
	{ 0, 0 } /* 0x0600000A System.Boolean UnityEngine.AudioSettings/Mobile::get_stopAudioOutputOnMute() */,
	{ 0, 0 } /* 0x0600000B System.Void UnityEngine.AudioSettings/Mobile::InvokeOnMuteStateChanged(System.Boolean) */,
	{ 0, 0 } /* 0x0600000C System.Boolean UnityEngine.AudioSettings/Mobile::InvokeIsStopAudioOutputOnMuteEnabled() */,
	{ 0, 0 } /* 0x0600000D System.Void UnityEngine.AudioSettings/Mobile::StartAudioOutput() */,
	{ 0, 0 } /* 0x0600000E System.Void UnityEngine.AudioSettings/Mobile::StopAudioOutput() */,
	{ 0, 0 } /* 0x0600000F System.Void UnityEngine.AudioClip::InvokePCMReaderCallback_Internal(System.Single[]) */,
	{ 0, 0 } /* 0x06000010 System.Void UnityEngine.AudioClip::InvokePCMSetPositionCallback_Internal(System.Int32) */,
	{ 0, 0 } /* 0x06000011 System.Void UnityEngine.AudioClip/PCMReaderCallback::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0 } /* 0x06000012 System.Void UnityEngine.AudioClip/PCMReaderCallback::Invoke(System.Single[]) */,
	{ 0, 0 } /* 0x06000013 System.Void UnityEngine.AudioClip/PCMSetPositionCallback::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0 } /* 0x06000014 System.Void UnityEngine.AudioClip/PCMSetPositionCallback::Invoke(System.Int32) */,
	{ 0, 0 } /* 0x06000015 System.Void UnityEngine.AudioSource::PlayOneShotHelper(UnityEngine.AudioSource,UnityEngine.AudioClip,System.Single) */,
	{ 0, 0 } /* 0x06000016 System.Void UnityEngine.AudioSource::PlayOneShot(UnityEngine.AudioClip) */,
	{ 0, 0 } /* 0x06000017 System.Void UnityEngine.AudioSource::PlayOneShot(UnityEngine.AudioClip,System.Single) */,
	{ 0, 0 } /* 0x06000018 System.Void UnityEngine.AudioSource::set_loop(System.Boolean) */,
	{ 0, 0 } /* 0x06000019 System.Void UnityEngine.AudioSource::set_playOnAwake(System.Boolean) */,
	{ 0, 0 } /* 0x0600001A System.String UnityEngine.WebCamDevice::get_name() */,
	{ 0, 0 } /* 0x0600001B UnityEngine.WebCamDevice[] UnityEngine.WebCamTexture::get_devices() */,
	{ 0, 0 } /* 0x0600001C System.Void UnityEngine.WebCamTexture::.ctor() */,
	{ 0, 0 } /* 0x0600001D System.Void UnityEngine.WebCamTexture::Play() */,
	{ 0, 0 } /* 0x0600001E System.Void UnityEngine.WebCamTexture::Stop() */,
	{ 0, 0 } /* 0x0600001F System.Boolean UnityEngine.WebCamTexture::get_isPlaying() */,
	{ 0, 0 } /* 0x06000020 System.Void UnityEngine.WebCamTexture::set_deviceName(System.String) */,
	{ 0, 0 } /* 0x06000021 System.Void UnityEngine.WebCamTexture::set_requestedFPS(System.Single) */,
	{ 0, 0 } /* 0x06000022 System.Void UnityEngine.WebCamTexture::set_requestedWidth(System.Int32) */,
	{ 0, 0 } /* 0x06000023 System.Void UnityEngine.WebCamTexture::set_requestedHeight(System.Int32) */,
	{ 0, 0 } /* 0x06000024 System.Boolean UnityEngine.WebCamTexture::get_didUpdateThisFrame() */,
	{ 0, 0 } /* 0x06000025 System.Void UnityEngine.WebCamTexture::Internal_CreateWebCamTexture(UnityEngine.WebCamTexture,System.String,System.Int32,System.Int32,System.Int32) */,
	{ 0, 0 } /* 0x06000026 UnityEngine.Playables.PlayableHandle UnityEngine.Audio.AudioClipPlayable::GetHandle() */,
	{ 0, 0 } /* 0x06000027 System.Boolean UnityEngine.Audio.AudioClipPlayable::Equals(UnityEngine.Audio.AudioClipPlayable) */,
	{ 0, 0 } /* 0x06000028 UnityEngine.Playables.PlayableHandle UnityEngine.Audio.AudioMixerPlayable::GetHandle() */,
	{ 0, 0 } /* 0x06000029 System.Boolean UnityEngine.Audio.AudioMixerPlayable::Equals(UnityEngine.Audio.AudioMixerPlayable) */,
	{ 0, 0 } /* 0x0600002A System.Void UnityEngine.Experimental.Audio.AudioSampleProvider::InvokeSampleFramesAvailable(System.Int32) */,
	{ 0, 0 } /* 0x0600002B System.Void UnityEngine.Experimental.Audio.AudioSampleProvider::InvokeSampleFramesOverflow(System.Int32) */,
	{ 0, 0 } /* 0x0600002C System.Void UnityEngine.Experimental.Audio.AudioSampleProvider/SampleFramesHandler::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0 } /* 0x0600002D System.Void UnityEngine.Experimental.Audio.AudioSampleProvider/SampleFramesHandler::Invoke(UnityEngine.Experimental.Audio.AudioSampleProvider,System.UInt32) */,
};
#else
static const Il2CppMethodExecutionContextInfoIndex g_methodExecutionContextInfoIndexes[1] = { { 0, 0} };
#endif
#if IL2CPP_MONO_DEBUGGER
IL2CPP_EXTERN_C Il2CppSequencePoint g_sequencePointsUnityEngine_AudioModule[];
Il2CppSequencePoint g_sequencePointsUnityEngine_AudioModule[163] = 
{
	{ 57720, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 0 } /* seqPointIndex: 0 */,
	{ 57720, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 1 } /* seqPointIndex: 1 */,
	{ 57720, 1, 343, 343, 9, 10, 0, kSequencePointKind_Normal, 0, 2 } /* seqPointIndex: 2 */,
	{ 57720, 1, 344, 344, 13, 53, 1, kSequencePointKind_Normal, 0, 3 } /* seqPointIndex: 3 */,
	{ 57720, 1, 344, 344, 0, 0, 10, kSequencePointKind_Normal, 0, 4 } /* seqPointIndex: 4 */,
	{ 57720, 1, 345, 345, 17, 63, 13, kSequencePointKind_Normal, 0, 5 } /* seqPointIndex: 5 */,
	{ 57720, 1, 345, 345, 17, 63, 19, kSequencePointKind_StepOut, 0, 6 } /* seqPointIndex: 6 */,
	{ 57720, 1, 346, 346, 9, 10, 25, kSequencePointKind_Normal, 0, 7 } /* seqPointIndex: 7 */,
	{ 57721, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 8 } /* seqPointIndex: 8 */,
	{ 57721, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 9 } /* seqPointIndex: 9 */,
	{ 57721, 1, 350, 350, 16, 51, 0, kSequencePointKind_Normal, 0, 10 } /* seqPointIndex: 10 */,
	{ 57721, 1, 350, 350, 16, 51, 11, kSequencePointKind_StepOut, 0, 11 } /* seqPointIndex: 11 */,
	{ 57722, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 12 } /* seqPointIndex: 12 */,
	{ 57722, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 13 } /* seqPointIndex: 13 */,
	{ 57722, 1, 354, 354, 16, 48, 0, kSequencePointKind_Normal, 0, 14 } /* seqPointIndex: 14 */,
	{ 57722, 1, 354, 354, 16, 48, 11, kSequencePointKind_StepOut, 0, 15 } /* seqPointIndex: 15 */,
	{ 57727, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 16 } /* seqPointIndex: 16 */,
	{ 57727, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 17 } /* seqPointIndex: 17 */,
	{ 57727, 1, 379, 379, 17, 21, 0, kSequencePointKind_Normal, 0, 18 } /* seqPointIndex: 18 */,
	{ 57728, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 19 } /* seqPointIndex: 19 */,
	{ 57728, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 20 } /* seqPointIndex: 20 */,
	{ 57728, 1, 380, 380, 17, 29, 0, kSequencePointKind_Normal, 0, 21 } /* seqPointIndex: 21 */,
	{ 57729, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 22 } /* seqPointIndex: 22 */,
	{ 57729, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 23 } /* seqPointIndex: 23 */,
	{ 57729, 1, 387, 387, 17, 18, 0, kSequencePointKind_Normal, 0, 24 } /* seqPointIndex: 24 */,
	{ 57729, 1, 388, 388, 21, 51, 1, kSequencePointKind_Normal, 0, 25 } /* seqPointIndex: 25 */,
	{ 57729, 1, 389, 389, 17, 18, 9, kSequencePointKind_Normal, 0, 26 } /* seqPointIndex: 26 */,
	{ 57730, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 27 } /* seqPointIndex: 27 */,
	{ 57730, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 28 } /* seqPointIndex: 28 */,
	{ 57730, 1, 412, 412, 13, 14, 0, kSequencePointKind_Normal, 0, 29 } /* seqPointIndex: 29 */,
	{ 57730, 1, 413, 413, 17, 39, 1, kSequencePointKind_Normal, 0, 30 } /* seqPointIndex: 30 */,
	{ 57730, 1, 413, 413, 17, 39, 2, kSequencePointKind_StepOut, 0, 31 } /* seqPointIndex: 31 */,
	{ 57730, 1, 413, 413, 0, 0, 13, kSequencePointKind_Normal, 0, 32 } /* seqPointIndex: 32 */,
	{ 57730, 1, 414, 414, 17, 18, 16, kSequencePointKind_Normal, 0, 33 } /* seqPointIndex: 33 */,
	{ 57730, 1, 415, 415, 21, 38, 17, kSequencePointKind_Normal, 0, 34 } /* seqPointIndex: 34 */,
	{ 57730, 1, 415, 415, 21, 38, 18, kSequencePointKind_StepOut, 0, 35 } /* seqPointIndex: 35 */,
	{ 57730, 1, 416, 416, 21, 47, 24, kSequencePointKind_Normal, 0, 36 } /* seqPointIndex: 36 */,
	{ 57730, 1, 416, 416, 21, 47, 24, kSequencePointKind_StepOut, 0, 37 } /* seqPointIndex: 37 */,
	{ 57730, 1, 416, 416, 0, 0, 30, kSequencePointKind_Normal, 0, 38 } /* seqPointIndex: 38 */,
	{ 57730, 1, 417, 417, 21, 22, 33, kSequencePointKind_Normal, 0, 39 } /* seqPointIndex: 39 */,
	{ 57730, 1, 418, 418, 25, 39, 34, kSequencePointKind_Normal, 0, 40 } /* seqPointIndex: 40 */,
	{ 57730, 1, 418, 418, 25, 39, 34, kSequencePointKind_StepOut, 0, 41 } /* seqPointIndex: 41 */,
	{ 57730, 1, 418, 418, 0, 0, 40, kSequencePointKind_Normal, 0, 42 } /* seqPointIndex: 42 */,
	{ 57730, 1, 419, 419, 29, 47, 43, kSequencePointKind_Normal, 0, 43 } /* seqPointIndex: 43 */,
	{ 57730, 1, 419, 419, 29, 47, 43, kSequencePointKind_StepOut, 0, 44 } /* seqPointIndex: 44 */,
	{ 57730, 1, 419, 419, 0, 0, 49, kSequencePointKind_Normal, 0, 45 } /* seqPointIndex: 45 */,
	{ 57730, 1, 421, 421, 29, 48, 51, kSequencePointKind_Normal, 0, 46 } /* seqPointIndex: 46 */,
	{ 57730, 1, 421, 421, 29, 48, 51, kSequencePointKind_StepOut, 0, 47 } /* seqPointIndex: 47 */,
	{ 57730, 1, 422, 422, 21, 22, 57, kSequencePointKind_Normal, 0, 48 } /* seqPointIndex: 48 */,
	{ 57730, 1, 423, 423, 21, 52, 58, kSequencePointKind_Normal, 0, 49 } /* seqPointIndex: 49 */,
	{ 57730, 1, 423, 423, 0, 0, 67, kSequencePointKind_Normal, 0, 50 } /* seqPointIndex: 50 */,
	{ 57730, 1, 424, 424, 25, 50, 70, kSequencePointKind_Normal, 0, 51 } /* seqPointIndex: 51 */,
	{ 57730, 1, 424, 424, 25, 50, 76, kSequencePointKind_StepOut, 0, 52 } /* seqPointIndex: 52 */,
	{ 57730, 1, 425, 425, 17, 18, 82, kSequencePointKind_Normal, 0, 53 } /* seqPointIndex: 53 */,
	{ 57730, 1, 426, 426, 13, 14, 83, kSequencePointKind_Normal, 0, 54 } /* seqPointIndex: 54 */,
	{ 57731, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 55 } /* seqPointIndex: 55 */,
	{ 57731, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 56 } /* seqPointIndex: 56 */,
	{ 57731, 1, 430, 430, 13, 14, 0, kSequencePointKind_Normal, 0, 57 } /* seqPointIndex: 57 */,
	{ 57731, 1, 431, 431, 17, 46, 1, kSequencePointKind_Normal, 0, 58 } /* seqPointIndex: 58 */,
	{ 57731, 1, 431, 431, 17, 46, 1, kSequencePointKind_StepOut, 0, 59 } /* seqPointIndex: 59 */,
	{ 57731, 1, 432, 432, 13, 14, 9, kSequencePointKind_Normal, 0, 60 } /* seqPointIndex: 60 */,
	{ 57732, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 61 } /* seqPointIndex: 61 */,
	{ 57732, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 62 } /* seqPointIndex: 62 */,
	{ 57732, 1, 435, 435, 13, 14, 0, kSequencePointKind_Normal, 0, 63 } /* seqPointIndex: 63 */,
	{ 57732, 1, 436, 436, 17, 50, 1, kSequencePointKind_Normal, 0, 64 } /* seqPointIndex: 64 */,
	{ 57732, 1, 436, 436, 17, 50, 1, kSequencePointKind_StepOut, 0, 65 } /* seqPointIndex: 65 */,
	{ 57732, 1, 437, 437, 13, 14, 7, kSequencePointKind_Normal, 0, 66 } /* seqPointIndex: 66 */,
	{ 57733, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 67 } /* seqPointIndex: 67 */,
	{ 57733, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 68 } /* seqPointIndex: 68 */,
	{ 57733, 1, 440, 440, 13, 14, 0, kSequencePointKind_Normal, 0, 69 } /* seqPointIndex: 69 */,
	{ 57733, 1, 441, 441, 17, 49, 1, kSequencePointKind_Normal, 0, 70 } /* seqPointIndex: 70 */,
	{ 57733, 1, 441, 441, 17, 49, 1, kSequencePointKind_StepOut, 0, 71 } /* seqPointIndex: 71 */,
	{ 57733, 1, 442, 442, 13, 14, 7, kSequencePointKind_Normal, 0, 72 } /* seqPointIndex: 72 */,
	{ 57734, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 73 } /* seqPointIndex: 73 */,
	{ 57734, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 74 } /* seqPointIndex: 74 */,
	{ 57734, 1, 632, 632, 9, 10, 0, kSequencePointKind_Normal, 0, 75 } /* seqPointIndex: 75 */,
	{ 57734, 1, 633, 633, 13, 45, 1, kSequencePointKind_Normal, 0, 76 } /* seqPointIndex: 76 */,
	{ 57734, 1, 633, 633, 0, 0, 11, kSequencePointKind_Normal, 0, 77 } /* seqPointIndex: 77 */,
	{ 57734, 1, 634, 634, 17, 43, 14, kSequencePointKind_Normal, 0, 78 } /* seqPointIndex: 78 */,
	{ 57734, 1, 634, 634, 17, 43, 21, kSequencePointKind_StepOut, 0, 79 } /* seqPointIndex: 79 */,
	{ 57734, 1, 635, 635, 9, 10, 27, kSequencePointKind_Normal, 0, 80 } /* seqPointIndex: 80 */,
	{ 57735, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 81 } /* seqPointIndex: 81 */,
	{ 57735, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 82 } /* seqPointIndex: 82 */,
	{ 57735, 1, 639, 639, 9, 10, 0, kSequencePointKind_Normal, 0, 83 } /* seqPointIndex: 83 */,
	{ 57735, 1, 640, 640, 13, 50, 1, kSequencePointKind_Normal, 0, 84 } /* seqPointIndex: 84 */,
	{ 57735, 1, 640, 640, 0, 0, 11, kSequencePointKind_Normal, 0, 85 } /* seqPointIndex: 85 */,
	{ 57735, 1, 641, 641, 17, 52, 14, kSequencePointKind_Normal, 0, 86 } /* seqPointIndex: 86 */,
	{ 57735, 1, 641, 641, 17, 52, 21, kSequencePointKind_StepOut, 0, 87 } /* seqPointIndex: 87 */,
	{ 57735, 1, 642, 642, 9, 10, 27, kSequencePointKind_Normal, 0, 88 } /* seqPointIndex: 88 */,
	{ 57741, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 89 } /* seqPointIndex: 89 */,
	{ 57741, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 90 } /* seqPointIndex: 90 */,
	{ 57741, 1, 864, 864, 9, 10, 0, kSequencePointKind_Normal, 0, 91 } /* seqPointIndex: 91 */,
	{ 57741, 1, 865, 865, 13, 37, 1, kSequencePointKind_Normal, 0, 92 } /* seqPointIndex: 92 */,
	{ 57741, 1, 865, 865, 13, 37, 8, kSequencePointKind_StepOut, 0, 93 } /* seqPointIndex: 93 */,
	{ 57741, 1, 866, 866, 9, 10, 14, kSequencePointKind_Normal, 0, 94 } /* seqPointIndex: 94 */,
	{ 57742, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 95 } /* seqPointIndex: 95 */,
	{ 57742, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 96 } /* seqPointIndex: 96 */,
	{ 57742, 1, 869, 869, 9, 10, 0, kSequencePointKind_Normal, 0, 97 } /* seqPointIndex: 97 */,
	{ 57742, 1, 870, 870, 13, 30, 1, kSequencePointKind_Normal, 0, 98 } /* seqPointIndex: 98 */,
	{ 57742, 1, 870, 870, 13, 30, 3, kSequencePointKind_StepOut, 0, 99 } /* seqPointIndex: 99 */,
	{ 57742, 1, 870, 870, 0, 0, 9, kSequencePointKind_Normal, 0, 100 } /* seqPointIndex: 100 */,
	{ 57742, 1, 871, 871, 13, 14, 12, kSequencePointKind_Normal, 0, 101 } /* seqPointIndex: 101 */,
	{ 57742, 1, 872, 872, 17, 83, 13, kSequencePointKind_Normal, 0, 102 } /* seqPointIndex: 102 */,
	{ 57742, 1, 872, 872, 17, 83, 18, kSequencePointKind_StepOut, 0, 103 } /* seqPointIndex: 103 */,
	{ 57742, 1, 873, 873, 17, 24, 24, kSequencePointKind_Normal, 0, 104 } /* seqPointIndex: 104 */,
	{ 57742, 1, 876, 876, 13, 56, 26, kSequencePointKind_Normal, 0, 105 } /* seqPointIndex: 105 */,
	{ 57742, 1, 876, 876, 13, 56, 29, kSequencePointKind_StepOut, 0, 106 } /* seqPointIndex: 106 */,
	{ 57742, 1, 877, 877, 9, 10, 35, kSequencePointKind_Normal, 0, 107 } /* seqPointIndex: 107 */,
	{ 57745, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 108 } /* seqPointIndex: 108 */,
	{ 57745, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 109 } /* seqPointIndex: 109 */,
	{ 57745, 2, 34, 34, 34, 35, 0, kSequencePointKind_Normal, 0, 110 } /* seqPointIndex: 110 */,
	{ 57745, 2, 34, 34, 36, 50, 1, kSequencePointKind_Normal, 0, 111 } /* seqPointIndex: 111 */,
	{ 57745, 2, 34, 34, 51, 52, 10, kSequencePointKind_Normal, 0, 112 } /* seqPointIndex: 112 */,
	{ 57747, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 113 } /* seqPointIndex: 113 */,
	{ 57747, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 114 } /* seqPointIndex: 114 */,
	{ 57747, 2, 103, 103, 9, 31, 0, kSequencePointKind_Normal, 0, 115 } /* seqPointIndex: 115 */,
	{ 57747, 2, 103, 103, 9, 31, 1, kSequencePointKind_StepOut, 0, 116 } /* seqPointIndex: 116 */,
	{ 57747, 2, 104, 104, 9, 10, 7, kSequencePointKind_Normal, 0, 117 } /* seqPointIndex: 117 */,
	{ 57747, 2, 105, 105, 13, 61, 8, kSequencePointKind_Normal, 0, 118 } /* seqPointIndex: 118 */,
	{ 57747, 2, 105, 105, 13, 61, 17, kSequencePointKind_StepOut, 0, 119 } /* seqPointIndex: 119 */,
	{ 57747, 2, 106, 106, 9, 10, 23, kSequencePointKind_Normal, 0, 120 } /* seqPointIndex: 120 */,
	{ 57757, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 121 } /* seqPointIndex: 121 */,
	{ 57757, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 122 } /* seqPointIndex: 122 */,
	{ 57757, 3, 49, 49, 9, 10, 0, kSequencePointKind_Normal, 0, 123 } /* seqPointIndex: 123 */,
	{ 57757, 3, 50, 50, 13, 29, 1, kSequencePointKind_Normal, 0, 124 } /* seqPointIndex: 124 */,
	{ 57757, 3, 51, 51, 9, 10, 10, kSequencePointKind_Normal, 0, 125 } /* seqPointIndex: 125 */,
	{ 57758, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 126 } /* seqPointIndex: 126 */,
	{ 57758, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 127 } /* seqPointIndex: 127 */,
	{ 57758, 3, 64, 64, 9, 10, 0, kSequencePointKind_Normal, 0, 128 } /* seqPointIndex: 128 */,
	{ 57758, 3, 65, 65, 13, 53, 1, kSequencePointKind_Normal, 0, 129 } /* seqPointIndex: 129 */,
	{ 57758, 3, 65, 65, 13, 53, 2, kSequencePointKind_StepOut, 0, 130 } /* seqPointIndex: 130 */,
	{ 57758, 3, 65, 65, 13, 53, 9, kSequencePointKind_StepOut, 0, 131 } /* seqPointIndex: 131 */,
	{ 57758, 3, 65, 65, 13, 53, 14, kSequencePointKind_StepOut, 0, 132 } /* seqPointIndex: 132 */,
	{ 57758, 3, 66, 66, 9, 10, 22, kSequencePointKind_Normal, 0, 133 } /* seqPointIndex: 133 */,
	{ 57759, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 134 } /* seqPointIndex: 134 */,
	{ 57759, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 135 } /* seqPointIndex: 135 */,
	{ 57759, 4, 47, 47, 9, 10, 0, kSequencePointKind_Normal, 0, 136 } /* seqPointIndex: 136 */,
	{ 57759, 4, 48, 48, 13, 29, 1, kSequencePointKind_Normal, 0, 137 } /* seqPointIndex: 137 */,
	{ 57759, 4, 49, 49, 9, 10, 10, kSequencePointKind_Normal, 0, 138 } /* seqPointIndex: 138 */,
	{ 57760, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 139 } /* seqPointIndex: 139 */,
	{ 57760, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 140 } /* seqPointIndex: 140 */,
	{ 57760, 4, 62, 62, 9, 10, 0, kSequencePointKind_Normal, 0, 141 } /* seqPointIndex: 141 */,
	{ 57760, 4, 63, 63, 13, 53, 1, kSequencePointKind_Normal, 0, 142 } /* seqPointIndex: 142 */,
	{ 57760, 4, 63, 63, 13, 53, 2, kSequencePointKind_StepOut, 0, 143 } /* seqPointIndex: 143 */,
	{ 57760, 4, 63, 63, 13, 53, 9, kSequencePointKind_StepOut, 0, 144 } /* seqPointIndex: 144 */,
	{ 57760, 4, 63, 63, 13, 53, 14, kSequencePointKind_StepOut, 0, 145 } /* seqPointIndex: 145 */,
	{ 57760, 4, 64, 64, 9, 10, 22, kSequencePointKind_Normal, 0, 146 } /* seqPointIndex: 146 */,
	{ 57761, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 147 } /* seqPointIndex: 147 */,
	{ 57761, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 148 } /* seqPointIndex: 148 */,
	{ 57761, 5, 177, 177, 9, 10, 0, kSequencePointKind_Normal, 0, 149 } /* seqPointIndex: 149 */,
	{ 57761, 5, 178, 178, 13, 47, 1, kSequencePointKind_Normal, 0, 150 } /* seqPointIndex: 150 */,
	{ 57761, 5, 178, 178, 0, 0, 11, kSequencePointKind_Normal, 0, 151 } /* seqPointIndex: 151 */,
	{ 57761, 5, 180, 180, 17, 69, 14, kSequencePointKind_Normal, 0, 152 } /* seqPointIndex: 152 */,
	{ 57761, 5, 180, 180, 17, 69, 22, kSequencePointKind_StepOut, 0, 153 } /* seqPointIndex: 153 */,
	{ 57761, 5, 181, 181, 9, 10, 28, kSequencePointKind_Normal, 0, 154 } /* seqPointIndex: 154 */,
	{ 57762, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 155 } /* seqPointIndex: 155 */,
	{ 57762, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 156 } /* seqPointIndex: 156 */,
	{ 57762, 5, 185, 185, 9, 10, 0, kSequencePointKind_Normal, 0, 157 } /* seqPointIndex: 157 */,
	{ 57762, 5, 186, 186, 13, 46, 1, kSequencePointKind_Normal, 0, 158 } /* seqPointIndex: 158 */,
	{ 57762, 5, 186, 186, 0, 0, 11, kSequencePointKind_Normal, 0, 159 } /* seqPointIndex: 159 */,
	{ 57762, 5, 187, 187, 17, 75, 14, kSequencePointKind_Normal, 0, 160 } /* seqPointIndex: 160 */,
	{ 57762, 5, 187, 187, 17, 75, 22, kSequencePointKind_StepOut, 0, 161 } /* seqPointIndex: 161 */,
	{ 57762, 5, 188, 188, 9, 10, 28, kSequencePointKind_Normal, 0, 162 } /* seqPointIndex: 162 */,
};
#else
extern Il2CppSequencePoint g_sequencePointsUnityEngine_AudioModule[];
Il2CppSequencePoint g_sequencePointsUnityEngine_AudioModule[1] = { { 0, 0, 0, 0, 0, 0, 0, kSequencePointKind_Normal, 0, 0, } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppCatchPoint g_catchPoints[1] = { { 0, 0, 0, 0, } };
#else
static const Il2CppCatchPoint g_catchPoints[1] = { { 0, 0, 0, 0, } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppSequencePointSourceFile g_sequencePointSourceFiles[] = {
{ "", { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} }, //0 
{ "\\home\\bokken\\build\\output\\unity\\unity\\Modules\\Audio\\Public\\ScriptBindings\\Audio.bindings.cs", { 186, 190, 129, 91, 137, 140, 111, 230, 114, 253, 155, 1, 230, 243, 216, 168} }, //1 
{ "\\home\\bokken\\build\\output\\unity\\unity\\Runtime\\Video\\ScriptBindings\\UnityEngineWebCamTexture.bindings.cs", { 107, 232, 133, 89, 169, 104, 188, 235, 113, 241, 20, 107, 179, 158, 185, 199} }, //2 
{ "\\home\\bokken\\build\\output\\unity\\unity\\Modules\\Audio\\Public\\ScriptBindings\\AudioClipPlayable.bindings.cs", { 117, 58, 219, 81, 174, 32, 141, 165, 250, 138, 140, 83, 41, 27, 0, 60} }, //3 
{ "\\home\\bokken\\build\\output\\unity\\unity\\Modules\\Audio\\Public\\ScriptBindings\\AudioMixerPlayable.bindings.cs", { 61, 101, 161, 191, 246, 243, 230, 247, 173, 244, 46, 184, 65, 58, 4, 90} }, //4 
{ "\\home\\bokken\\build\\output\\unity\\unity\\Modules\\Audio\\Public\\ScriptBindings\\AudioSampleProvider.bindings.cs", { 47, 120, 50, 45, 60, 26, 245, 52, 137, 63, 13, 94, 178, 230, 94, 160} }, //5 
};
#else
static const Il2CppSequencePointSourceFile g_sequencePointSourceFiles[1] = { NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppTypeSourceFilePair g_typeSourceFiles[9] = 
{
	{ 7901, 1 },
	{ 7900, 1 },
	{ 7904, 1 },
	{ 7907, 1 },
	{ 7909, 2 },
	{ 7910, 2 },
	{ 7912, 3 },
	{ 7913, 4 },
	{ 7915, 5 },
};
#else
static const Il2CppTypeSourceFilePair g_typeSourceFiles[1] = { { 0, 0 } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodScope g_methodScopes[14] = 
{
	{ 0, 26 },
	{ 0, 11 },
	{ 0, 84 },
	{ 0, 11 },
	{ 0, 28 },
	{ 0, 28 },
	{ 0, 36 },
	{ 0, 12 },
	{ 0, 12 },
	{ 0, 24 },
	{ 0, 12 },
	{ 0, 24 },
	{ 0, 29 },
	{ 0, 29 },
};
#else
static const Il2CppMethodScope g_methodScopes[1] = { { 0, 0 } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodHeaderInfo g_methodHeaderInfos[45] = 
{
	{ 26, 0, 1 } /* System.Void UnityEngine.AudioSettings::InvokeOnAudioConfigurationChanged(System.Boolean) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSettings::InvokeOnAudioSystemShuttingDown() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSettings::InvokeOnAudioSystemStartedUp() */,
	{ 0, 0, 0 } /* System.Boolean UnityEngine.AudioSettings::StartAudioOutput() */,
	{ 0, 0, 0 } /* System.Boolean UnityEngine.AudioSettings::StopAudioOutput() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSettings/AudioConfigurationChangeHandler::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSettings/AudioConfigurationChangeHandler::Invoke(System.Boolean) */,
	{ 0, 0, 0 } /* System.Boolean UnityEngine.AudioSettings/Mobile::get_muteState() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSettings/Mobile::set_muteState(System.Boolean) */,
	{ 11, 1, 1 } /* System.Boolean UnityEngine.AudioSettings/Mobile::get_stopAudioOutputOnMute() */,
	{ 84, 2, 1 } /* System.Void UnityEngine.AudioSettings/Mobile::InvokeOnMuteStateChanged(System.Boolean) */,
	{ 11, 3, 1 } /* System.Boolean UnityEngine.AudioSettings/Mobile::InvokeIsStopAudioOutputOnMuteEnabled() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSettings/Mobile::StartAudioOutput() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSettings/Mobile::StopAudioOutput() */,
	{ 28, 4, 1 } /* System.Void UnityEngine.AudioClip::InvokePCMReaderCallback_Internal(System.Single[]) */,
	{ 28, 5, 1 } /* System.Void UnityEngine.AudioClip::InvokePCMSetPositionCallback_Internal(System.Int32) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioClip/PCMReaderCallback::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioClip/PCMReaderCallback::Invoke(System.Single[]) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioClip/PCMSetPositionCallback::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioClip/PCMSetPositionCallback::Invoke(System.Int32) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSource::PlayOneShotHelper(UnityEngine.AudioSource,UnityEngine.AudioClip,System.Single) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSource::PlayOneShot(UnityEngine.AudioClip) */,
	{ 36, 6, 1 } /* System.Void UnityEngine.AudioSource::PlayOneShot(UnityEngine.AudioClip,System.Single) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSource::set_loop(System.Boolean) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.AudioSource::set_playOnAwake(System.Boolean) */,
	{ 12, 7, 1 } /* System.String UnityEngine.WebCamDevice::get_name() */,
	{ 0, 0, 0 } /* UnityEngine.WebCamDevice[] UnityEngine.WebCamTexture::get_devices() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::.ctor() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::Play() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::Stop() */,
	{ 0, 0, 0 } /* System.Boolean UnityEngine.WebCamTexture::get_isPlaying() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::set_deviceName(System.String) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::set_requestedFPS(System.Single) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::set_requestedWidth(System.Int32) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::set_requestedHeight(System.Int32) */,
	{ 0, 0, 0 } /* System.Boolean UnityEngine.WebCamTexture::get_didUpdateThisFrame() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.WebCamTexture::Internal_CreateWebCamTexture(UnityEngine.WebCamTexture,System.String,System.Int32,System.Int32,System.Int32) */,
	{ 12, 8, 1 } /* UnityEngine.Playables.PlayableHandle UnityEngine.Audio.AudioClipPlayable::GetHandle() */,
	{ 24, 9, 1 } /* System.Boolean UnityEngine.Audio.AudioClipPlayable::Equals(UnityEngine.Audio.AudioClipPlayable) */,
	{ 12, 10, 1 } /* UnityEngine.Playables.PlayableHandle UnityEngine.Audio.AudioMixerPlayable::GetHandle() */,
	{ 24, 11, 1 } /* System.Boolean UnityEngine.Audio.AudioMixerPlayable::Equals(UnityEngine.Audio.AudioMixerPlayable) */,
	{ 29, 12, 1 } /* System.Void UnityEngine.Experimental.Audio.AudioSampleProvider::InvokeSampleFramesAvailable(System.Int32) */,
	{ 29, 13, 1 } /* System.Void UnityEngine.Experimental.Audio.AudioSampleProvider::InvokeSampleFramesOverflow(System.Int32) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.Experimental.Audio.AudioSampleProvider/SampleFramesHandler::.ctor(System.Object,System.IntPtr) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.Experimental.Audio.AudioSampleProvider/SampleFramesHandler::Invoke(UnityEngine.Experimental.Audio.AudioSampleProvider,System.UInt32) */,
};
#else
static const Il2CppMethodHeaderInfo g_methodHeaderInfos[1] = { { 0, 0, 0 } };
#endif
IL2CPP_EXTERN_C const Il2CppDebuggerMetadataRegistration g_DebuggerMetadataRegistrationUnityEngine_AudioModule;
const Il2CppDebuggerMetadataRegistration g_DebuggerMetadataRegistrationUnityEngine_AudioModule = 
{
	(Il2CppMethodExecutionContextInfo*)g_methodExecutionContextInfos,
	(Il2CppMethodExecutionContextInfoIndex*)g_methodExecutionContextInfoIndexes,
	(Il2CppMethodScope*)g_methodScopes,
	(Il2CppMethodHeaderInfo*)g_methodHeaderInfos,
	(Il2CppSequencePointSourceFile*)g_sequencePointSourceFiles,
	163,
	(Il2CppSequencePoint*)g_sequencePointsUnityEngine_AudioModule,
	0,
	(Il2CppCatchPoint*)g_catchPoints,
	9,
	(Il2CppTypeSourceFilePair*)g_typeSourceFiles,
	(const char**)g_methodExecutionContextInfoStrings,
};
