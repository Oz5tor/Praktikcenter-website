/*
@license

dhtmlxGantt v.3.3.0 Stardard
This software is covered by GPL license. You also can obtain Commercial or Enterprise license to use it in non-GPL project - please contact sales@dhtmlx.com. Usage without proper license is prohibited.

(c) Dinamenta, UAB.
*/
gantt._onFullScreenChange=function(){!gantt.getState().fullscreen||null!==document.fullscreenElement&&null!==document.mozFullScreenElement&&null!==document.webkitFullscreenElement&&null!==document.msFullscreenElement||gantt.collapse()},document.addEventListener&&(document.addEventListener("webkitfullscreenchange",gantt._onFullScreenChange),document.addEventListener("mozfullscreenchange",gantt._onFullScreenChange),document.addEventListener("MSFullscreenChange",gantt._onFullScreenChange),document.addEventListener("fullscreenChange",gantt._onFullScreenChange),
document.addEventListener("fullscreenchange",gantt._onFullScreenChange)),gantt.expand=function(){if(gantt.callEvent("onBeforeExpand",[])){gantt._toggleFullScreen(!0);var e=gantt._obj;do e._position=e.style.position||"",e.style.position="static";while((e=e.parentNode)&&e.style);e=gantt._obj,e.style.position="absolute",e._width=e.style.width,e._height=e.style.height,e.style.width=e.style.height="100%",e.style.top=e.style.left="0px";var t=document.body;t.scrollTop=0,t=t.parentNode,t&&(t.scrollTop=0),
document.body._overflow=document.body.style.overflow||"",document.body.style.overflow="hidden",document.documentElement.msRequestFullscreen&&gantt._obj&&window.setTimeout(function(){gantt._obj.style.width=window.outerWidth+"px"},1),gantt._maximize(),gantt.callEvent("onExpand",[])}},gantt.collapse=function(){if(gantt.callEvent("onBeforeCollapse",[])){var e=gantt._obj;do e.style.position=e._position;while((e=e.parentNode)&&e.style);e=gantt._obj,e.style.width=e._width,e.style.height=e._height,document.body.style.overflow=document.body._overflow,
gantt._toggleFullScreen(!1),gantt._maximize(),gantt.callEvent("onCollapse",[])}},function(){var e=gantt.getState;gantt.getState=function(){var t=e.apply(this,arguments);return t.fullscreen=!!this._expanded,t}}(),gantt._maximize=function(){this._expanded=!this._expanded,this.render()},gantt._toggleFullScreen=function(e){!e&&(document.fullscreenElement||document.mozFullScreenElement||document.webkitFullscreenElement||document.msFullscreenElement)?document.exitFullscreen?document.exitFullscreen():document.msExitFullscreen?document.msExitFullscreen():document.mozCancelFullScreen?document.mozCancelFullScreen():document.webkitExitFullscreen&&document.webkitExitFullscreen():document.documentElement.requestFullscreen?document.documentElement.requestFullscreen():document.documentElement.msRequestFullscreen?document.documentElement.msRequestFullscreen():document.documentElement.mozRequestFullScreen?document.documentElement.mozRequestFullScreen():document.documentElement.webkitRequestFullscreen&&document.documentElement.webkitRequestFullscreen(Element.ALLOW_KEYBOARD_INPUT);
};
//# sourceMappingURL=../sources/ext/dhtmlxgantt_fullscreen.js.map