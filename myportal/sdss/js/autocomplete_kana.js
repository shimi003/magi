/*
 auther: 清水正行 氏
 URL   : https://shimz.me/blog/javascript/3471
*/

(function( $ ) {
	$.widget( "custom.combobox", {
		_create: function() {
			this.wrapper = $( "<span>" )
			.addClass( "custom-combobox" )
			.insertAfter( this.element );

			this.element.hide();
			this._createAutocomplete();
			this._createShowAllButton();
		},

		_createAutocomplete: function() {
			var selected = this.element.children( ":selected" ),
			value = selected.val() ? selected.text() : "";

			this.input = $( "<input>" )
				.appendTo( this.wrapper )
				.val( value )
				.attr( "title", "" )
				.addClass( "custom-combobox-input ui-widget ui-widget-content ui-state-default ui-corner-left" )
				.autocomplete({
					delay: 0,
					minLength: 0,
					source: $.proxy( this, "_source" )
				})
				.tooltip({
					tooltipClass: "ui-state-highlight"
				})
				.keypress(function(e) { //enterキーでのsubmitを抑制
					var c = e.which ? e.which : e.keyCode;
					if (c == 13) {
						e.preventDefault();
					}
				});

			this._on( this.input, {
				autocompleteselect: function( event, ui ) {
					ui.item.option.selected = true;
					this._trigger( "select", event, {
						item: ui.item.option
					});
				},

				autocompletechange: "_removeIfInvalid"
			});
		},

		_createShowAllButton: function() {
			var input = this.input,
			wasOpen = false;

			$( "<a>" )
				.attr( "tabIndex", -1 )
				.attr( "title", "Show All Items" )
				.tooltip()
				.appendTo( this.wrapper )
				.button({
					icons: {
						primary: "ui-icon-triangle-1-s"
					},
					text: false
				})
				.removeClass( "ui-corner-all" )
				.addClass( "custom-combobox-toggle ui-corner-right" )
				.mousedown(function() {
					wasOpen = input.autocomplete( "widget" ).is( ":visible" );
				})
				.click(function() {
					input.focus();

					// 一覧が表示されているときは非表示に
					if ( wasOpen ) {
						return;
					}

					// 全ての値を表示。検索文字として空文字を渡す
					input.autocomplete( "search", "" );
				});
		},


		_source: function( request, response ) {
			var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex(request.term), "i" ); //前方一致
			response( this.element.children( "option" ).map(function() {
				var kana = $( this ).data('kana');　//かな名を取得
				var text = $( this ).text();
				var value = $( this ).val();
				if ( this.value && ( !request.term || matcher.test(kana) ) ) //入力文字とかな名のマッチ
				return {
					label: text, //一覧表示時の候補ラベル名
					value: value, //値(submitで渡す値)
					option: this
				};
			}) );
		},

		_removeIfInvalid: function( event, ui ) {

			// 何も選択されていないときは離脱
			if ( ui.item ) {
				return;
			}

			//一致を検索
			var value = this.input.val(),
			valueLowerCase = value.toLowerCase(),
			valid = false;
			this.element.children( "option" ).each(function() {
				//大文字小文字チェック。日本語だと意味がない。かな＝カナチェックに変えても良いかも
				if ( $( this ).text().toLowerCase() === valueLowerCase ) {　
					this.selected = valid = true;
					return false;
				}
			});

			//　見つけたら離脱
			if ( valid ) {
				return;
			}

			// 見つからなかった時の処理　（無効な値を削除)
			this.input
				.val( "" )
				.attr( "title", "「" +　value + "」に一致する値は見つかりませんでした" )
				.tooltip( "open" );
				this.element.val( "" );
				this._delay(function() {
					this.input.tooltip( "close" ).attr( "title", "" );
				}, 2500 );
			this.input.data( "ui-autocomplete" ).term = "";
		},

		_destroy: function() {
			this.wrapper.remove();
			this.element.show();
		}
	});
})( jQuery );
