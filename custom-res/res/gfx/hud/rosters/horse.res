Haven Resource 1< src �	  Horse.java /* Preprocessed source code */
/* $use: ui/croster */

package haven.res.gfx.hud.rosters.horse;

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class Horse extends Entry {
    public int meat, milk;
    public int meatq, milkq, hideq;
    public int seedq;
    public int end, stam, mb;
    public boolean stallion, foal, dead, pregnant, lactate, owned, mine;

    public Horse(long id, String name) {
	super(SIZE, id, name);
    }

    public void draw(GOut g) {
	drawbg(g);
	int i = 0;
	drawcol(g, HorseRoster.cols.get(i), 0, this, namerend, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, stallion, sex, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, foal,     growth, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, dead,     deadrend, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, pregnant, pregrend, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, lactate,  lactrend, i++);
	drawcol(g, HorseRoster.cols.get(i), 0.5, (owned ? 1 : 0) | (mine ? 2 : 0), ownrend, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, q, quality, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, end, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, stam, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, mb, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, meat, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, milk, null, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, meatq, percent, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, milkq, percent, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, hideq, percent, i++);
	drawcol(g, HorseRoster.cols.get(i), 1, seedq, null, i++);
	super.draw(g);
    }

    public boolean mousedown(Coord c, int button) {
	if(HorseRoster.cols.get(1).hasx(c.x)) {
	    markall(Horse.class, o -> (o.stallion == this.stallion));
	    return(true);
	}
	if(HorseRoster.cols.get(2).hasx(c.x)) {
	    markall(Horse.class, o -> (o.foal == this.foal));
	    return(true);
	}
	if(HorseRoster.cols.get(3).hasx(c.x)) {
	    markall(Horse.class, o -> (o.dead == this.dead));
	    return(true);
	}
	if(HorseRoster.cols.get(4).hasx(c.x)) {
	    markall(Horse.class, o -> (o.pregnant == this.pregnant));
	    return(true);
	}
	if(HorseRoster.cols.get(5).hasx(c.x)) {
	    markall(Horse.class, o -> (o.lactate == this.lactate));
	    return(true);
	}
	if(HorseRoster.cols.get(6).hasx(c.x)) {
	    markall(Horse.class, o -> ((o.owned == this.owned) && (o.mine == this.mine)));
	    return(true);
	}
	return(super.mousedown(c, button));
    }
}

/* >wdg: HorseRoster */
src   HorseRoster.java /* Preprocessed source code */
/* $use: ui/croster */

package haven.res.gfx.hud.rosters.horse;

import haven.*;
import haven.res.ui.croster.*;
import java.util.*;

public class HorseRoster extends CattleRoster<Horse> {
    public static List<Column> cols = initcols(
	new Column<Entry>("Name", Comparator.comparing((Entry e) -> e.name), 200),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/sex", 2),      Comparator.comparing((Horse e) -> e.stallion).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/growth", 2),   Comparator.comparing((Horse e) -> e.foal).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/deadp", 3),    Comparator.comparing((Horse e) -> e.dead).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/pregnant", 2), Comparator.comparing((Horse e) -> e.pregnant).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/lactate", 1),  Comparator.comparing((Horse e) -> e.lactate).reversed(), 20).runon(),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/owned", 1),    Comparator.comparing((Horse e) -> ((e.owned ? 1 : 0) | (e.mine ? 2 : 0))).reversed(), 20),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/quality", 2), Comparator.comparing((Horse e) -> e.q).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/endurance", 1), Comparator.comparing((Horse e) -> e.end).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/stamina", 1), Comparator.comparing((Horse e) -> e.stam).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/metabolism", 1), Comparator.comparing((Horse e) -> e.mb).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/meatquantity", 1), Comparator.comparing((Horse e) -> e.meat).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/milkquantity", 1), Comparator.comparing((Horse e) -> e.milk).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/meatquality", 1), Comparator.comparing((Horse e) -> e.meatq).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/milkquality", 1), Comparator.comparing((Horse e) -> e.milkq).reversed()),
	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/hidequality", 1), Comparator.comparing((Horse e) -> e.hideq).reversed()),

	new Column<Horse>(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/breedingquality", 1), Comparator.comparing((Horse e) -> e.seedq).reversed())
    );
    protected List<Column> cols() {return(cols);}

    public static CattleRoster mkwidget(UI ui, Object... args) {
	return(new HorseRoster());
    }

    public Horse parse(Object... args) {
	int n = 0;
	long id = (Long)args[n++];
	String name = (String)args[n++];
	Horse ret = new Horse(id, name);
	ret.grp = (Integer)args[n++];
	int fl = (Integer)args[n++];
	ret.stallion = (fl & 1) != 0;
	ret.foal = (fl & 2) != 0;
	ret.dead = (fl & 4) != 0;
	ret.pregnant = (fl & 8) != 0;
	ret.lactate = (fl & 16) != 0;
	ret.owned = (fl & 32) != 0;
	ret.mine = (fl & 64) != 0;
	ret.q = ((Number)args[n++]).doubleValue();
	ret.meat = (Integer)args[n++];
	ret.milk = (Integer)args[n++];
	ret.meatq = (Integer)args[n++];
	ret.milkq = (Integer)args[n++];
	ret.hideq = (Integer)args[n++];
	ret.seedq = (Integer)args[n++];
	ret.end = (Integer)args[n++];
	ret.stam = (Integer)args[n++];
	ret.mb = (Integer)args[n++];
	return(ret);
    }

    public TypeButton button() {
	return(typebtn(Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/btn-horse", 2),
		       Resource.classres(HorseRoster.class).pool.load("gfx/hud/rosters/btn-horse-d", 2)));
    }
}
code q  haven.res.gfx.hud.rosters.horse.Horse ����   4 �	 * [
 3 \
 * ]	 ^ _ ` a b	 * c
 * d?�      	 * e
 f g	 * h	 * i	 * j	 * k	 * l	 * m	 * n	 * o	 * p	 * q	 * r
 s t	 * u	 * v
 w x	 * y	 * z	 * {	 * |	 * }	 * ~	 * 	 * �	 * �	 * �	 * �
 3 �	 � �
  � �   �
 * �  �  �  �  �  �
 3 � � meat I milk meatq milkq hideq seedq end stam mb stallion Z foal dead pregnant lactate owned mine <init> (JLjava/lang/String;)V Code LineNumberTable draw (Lhaven/GOut;)V StackMapTable � � b 	mousedown (Lhaven/Coord;I)Z lambda$mousedown$5 *(Lhaven/res/gfx/hud/rosters/horse/Horse;)Z lambda$mousedown$4 lambda$mousedown$3 lambda$mousedown$2 lambda$mousedown$1 lambda$mousedown$0 
SourceFile 
Horse.java � � F � � K � � � � � � haven/res/ui/croster/Column � � � � > ? � � � � � @ ? � � A ? � � B ? � � C ? � � D ? E ? � � � � � � � � � � � � ; 5 < 5 = 5 4 5 6 5 7 5 � � 8 5 9 5 : 5 J K � � 5 � � %haven/res/gfx/hud/rosters/horse/Horse BootstrapMethods � � � S � � � � � � � � � P Q haven/res/ui/croster/Entry 
haven/GOut SIZE Lhaven/Coord; #(Lhaven/Coord;JLjava/lang/String;)V drawbg +haven/res/gfx/hud/rosters/horse/HorseRoster cols Ljava/util/List; java/util/List get (I)Ljava/lang/Object; namerend Ljava/util/function/Function; drawcol ](Lhaven/GOut;Lhaven/res/ui/croster/Column;DLjava/lang/Object;Ljava/util/function/Function;I)V java/lang/Boolean valueOf (Z)Ljava/lang/Boolean; sex growth deadrend pregrend lactrend java/lang/Integer (I)Ljava/lang/Integer; ownrend q D java/lang/Double (D)Ljava/lang/Double; quality percent haven/Coord x hasx (I)Z
 � � (Ljava/lang/Object;)Z
 * � test G(Lhaven/res/gfx/hud/rosters/horse/Horse;)Ljava/util/function/Predicate; markall 2(Ljava/lang/Class;Ljava/util/function/Predicate;)V
 * �
 * �
 * �
 * �
 * � � � � X S W S V S U S T S R S "java/lang/invoke/LambdaMetafactory metafactory � Lookup InnerClasses �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite; � %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles horse.cjava ! * 3     4 5    6 5    7 5    8 5    9 5    : 5    ; 5    < 5    = 5    > ?    @ ?    A ?    B ?    C ?    D ?    E ?   	  F G  H   &     
*� -� �    I   
     	   J K  H      <*+� =*+� �  � *� �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � �� *+� �  �  	*� � � *� � � �� � �� *+� �  � *� � � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *� � �� *+� �  � *�  � �� *+� �  � *� !� �� *+� �  � *� "� � #�� *+� �  � *� $� � #�� *+� �  � *� %� � #�� *+� �  � *� &� �� *+� '�    L   f � �  M N  M N O�    M N  M N O� 
  M N  M N O�    M N  M N O I   V         !  C  e  �  �  �  " @  ^ !| "� #� $� %� & '6 (; )  P Q  H  N     � �  � +� (� )� ***� +  � ,�� �  � +� (� )� ***� -  � ,�� �  � +� (� )� ***� .  � ,�� �  � +� (� )� ***� /  � ,�� �  � +� (� )� ***� 0  � ,�� �  � +� (� )� ***� 1  � ,�*+� 2�    L    $####$ I   N    ,  - " . $ 0 : 1 F 2 H 4 ^ 5 j 6 l 8 � 9 � : � < � = � > � @ � A � B � D R S  H   ?     +� *� � +� *� � � �    L    @ I       A T S  H   4     +� *� � � �    L    @ I       = U S  H   4     +� *� � � �    L    @ I       9 V S  H   4     +� *� � � �    L    @ I       5 W S  H   4     +� *� � � �    L    @ I       1 X S  H   4     +� *� � � �    L    @ I       -  �   >  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � Y    � �   
  � � � code -  haven.res.gfx.hud.rosters.horse.HorseRoster ����   4Y
 U �	  � �
  � �
  � � �
  � �
 
 �	  �	  �	  �	  �	  �	  �	  �	  � �
  �	  �	  �	  �	  �	  �	  �	  �	  �	  �	  �
 � �	 � � �
 � � �
  �
  �
 
 �
 � �
 � �	 � � � �   � � �
 + � �  � � �
 + �
 + � �  � �  � �  � �  � �  � �  �
 + � �  � � 	 � � 
 � �  � �  � �  � �  � �  � �  �
  � � cols Ljava/util/List; 	Signature /Ljava/util/List<Lhaven/res/ui/croster/Column;>; <init> ()V Code LineNumberTable ()Ljava/util/List; 1()Ljava/util/List<Lhaven/res/ui/croster/Column;>; mkwidget B(Lhaven/UI;[Ljava/lang/Object;)Lhaven/res/ui/croster/CattleRoster; parse <([Ljava/lang/Object;)Lhaven/res/gfx/hud/rosters/horse/Horse; StackMapTable � � � � button #()Lhaven/res/ui/croster/TypeButton; 1([Ljava/lang/Object;)Lhaven/res/ui/croster/Entry; lambda$static$16 <(Lhaven/res/gfx/hud/rosters/horse/Horse;)Ljava/lang/Integer; lambda$static$15 lambda$static$14 lambda$static$13 lambda$static$12 lambda$static$11 lambda$static$10 lambda$static$9 lambda$static$8 lambda$static$7 ;(Lhaven/res/gfx/hud/rosters/horse/Horse;)Ljava/lang/Double; lambda$static$6 lambda$static$5 <(Lhaven/res/gfx/hud/rosters/horse/Horse;)Ljava/lang/Boolean; lambda$static$4 lambda$static$3 lambda$static$2 lambda$static$1 lambda$static$0 0(Lhaven/res/ui/croster/Entry;)Ljava/lang/String; <clinit> LLhaven/res/ui/croster/CattleRoster<Lhaven/res/gfx/hud/rosters/horse/Horse;>; 
SourceFile HorseRoster.java Z [ V W +haven/res/gfx/hud/rosters/horse/HorseRoster java/lang/Long � � java/lang/String %haven/res/gfx/hud/rosters/horse/Horse Z � java/lang/Integer � � � � � � � � � � � � � � � � � � java/lang/Number � � � � � � � � � � � � � �  � � � �
 gfx/hud/rosters/btn-horse gfx/hud/rosters/btn-horse-d b c haven/res/ui/croster/Column Name BootstrapMethods � !" Z# gfx/hud/rosters/sex$ z%& Z'() gfx/hud/rosters/growth* gfx/hud/rosters/deadp+ gfx/hud/rosters/pregnant, gfx/hud/rosters/lactate- gfx/hud/rosters/owned. m gfx/hud/rosters/quality/ w Z0 gfx/hud/rosters/endurance1 gfx/hud/rosters/stamina2 gfx/hud/rosters/metabolism3 gfx/hud/rosters/meatquantity4 gfx/hud/rosters/milkquantity5 gfx/hud/rosters/meatquality6 gfx/hud/rosters/milkquality7 gfx/hud/rosters/hidequality8 gfx/hud/rosters/breedingquality9:; !haven/res/ui/croster/CattleRoster [Ljava/lang/Object; 	longValue ()J (JLjava/lang/String;)V intValue ()I grp I stallion Z foal dead pregnant lactate owned mine doubleValue ()D q D meat milk meatq milkq hideq seedq end stam mb haven/Resource classres #(Ljava/lang/Class;)Lhaven/Resource; pool Pool InnerClasses Lhaven/Resource$Pool; haven/Resource$Pool load< Named +(Ljava/lang/String;I)Lhaven/Resource$Named; typebtn =(Lhaven/Indir;Lhaven/Indir;)Lhaven/res/ui/croster/TypeButton; valueOf (I)Ljava/lang/Integer; java/lang/Double (D)Ljava/lang/Double; java/lang/Boolean (Z)Ljava/lang/Boolean; haven/res/ui/croster/Entry name Ljava/lang/String;
=> &(Ljava/lang/Object;)Ljava/lang/Object;
 ? apply ()Ljava/util/function/Function; java/util/Comparator 	comparing 5(Ljava/util/function/Function;)Ljava/util/Comparator; ,(Ljava/lang/String;Ljava/util/Comparator;I)V
 @ reversed ()Ljava/util/Comparator; '(Lhaven/Indir;Ljava/util/Comparator;I)V runon ()Lhaven/res/ui/croster/Column;
 A
 B
 C
 D
 E
 F &(Lhaven/Indir;Ljava/util/Comparator;)V
 G
 H
 I
 J
 K
 L
 M
 N
 O initcols 0([Lhaven/res/ui/croster/Column;)Ljava/util/List; haven/Resource$NamedPQT  � ~ z } z | z { z y z x m v w u m t m s m r m q m p m o m n m l m "java/lang/invoke/LambdaMetafactory metafactoryV Lookup �(Ljava/lang/invoke/MethodHandles$Lookup;Ljava/lang/String;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodType;Ljava/lang/invoke/MethodHandle;Ljava/lang/invoke/MethodType;)Ljava/lang/invoke/CallSite;W %java/lang/invoke/MethodHandles$Lookup java/lang/invoke/MethodHandles horse.cjava !  U    	 V W  X    Y   Z [  \        *� �    ]       I  V ^  \        � �    ]       c X    _ � ` a  \         � Y� �    ]       f � b c  \  �    m=+�2� � B+�2� :� Y!� 	:+�2� 
� � +�2� 
� 6~� � � ~� � � ~� � � ~� � � ~� � �  ~� � � @~� � � +�2� � � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � +�2� 
� � �    d   � � R  e f g h  h�    e f g h  hO h�    e f g h  hO h�    e f g h  hP h�    e f g h  hP h�    e f g h  hP h�    e f g h  hP h�    e f g h  h ]   b    j  k  l  m & n 7 o E p V q g r x s � t � u � v � w � x � y � z { |& }7 ~H Y �j �  i j  \   @      �  � !"� #�  � !$� #� %�    ]       �  �  �A b k  \        *+� &�    ]       I
 l m  \         *� � '�    ]       a
 n m  \         *� � '�    ]       _
 o m  \         *� � '�    ]       ^
 p m  \         *� � '�    ]       ]
 q m  \         *� � '�    ]       [
 r m  \         *� � '�    ]       Z
 s m  \         *� � '�    ]       X
 t m  \         *� � '�    ]       W
 u m  \         *� � '�    ]       V
 v w  \         *� � (�    ]       T
 x m  \   N     *� � � *� � � �� '�    d    @J�    h  ]       R
 y z  \         *� � )�    ]       Q
 { z  \         *� � )�    ]       P
 | z  \         *� � )�    ]       O
 } z  \         *� � )�    ]       N
 ~ z  \         *� � )�    ]       M
  �  \        *� *�    ]       K  � [  \  �     �� +Y� +Y,� -  � . ȷ /SY� +Y�  � !0� #� 1  � .� 2 � 3� 4SY� +Y�  � !5� #� 6  � .� 2 � 3� 4SY� +Y�  � !7� #� 8  � .� 2 � 3� 4SY� +Y�  � !9� #� :  � .� 2 � 3� 4SY� +Y�  � !;� #� <  � .� 2 � 3� 4SY� +Y�  � !=� #� >  � .� 2 � 3SY� +Y�  � !?� #� @  � .� 2 � ASY� +Y�  � !B� #� C  � .� 2 � ASY	� +Y�  � !D� #� E  � .� 2 � ASY
� +Y�  � !F� #� G  � .� 2 � ASY� +Y�  � !H� #� I  � .� 2 � ASY� +Y�  � !J� #� K  � .� 2 � ASY� +Y�  � !L� #� M  � .� 2 � ASY� +Y�  � !N� #� O  � .� 2 � ASY� +Y�  � !P� #� Q  � .� 2 � ASY� +Y�  � !R� #� S  � .� 2 � AS� T� �    ]   N    J  K $ M N N x O � P � Q � R TE Vk W� X� Z� [ ]) ^O _u a� J  �   �  �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �  � � � �   X X    �	     � � 	 �	RUS codeentry B   wdg haven.res.gfx.hud.rosters.horse.HorseRoster   ui/croster H  