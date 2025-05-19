mergeInto(LibraryManager.library, { 
  GameOver: function (username, score) {
    wndow.dispatchReactUnityEvent("GameOver", UTF8ToString(username), score);
  },
});