%%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{SCNUThesisV3}
[2025/3/11   Version 3.0 South China Normal University, Thesis Template, Zhong Liuqiang]
%% 若有需要, 请联系 zhong@m.scnu.edu.cn

%% 【2025年4月30日】本模板根据钟老师模板进行修改，在字体字号上、页眉设置、图表标题上进一步符合2024年7月发布的论文格式要求
%% 【2025年4月30日】修改人邮箱为jerrylcu@163.com

\newif\ifscnu@profdeg\scnu@profdegfalse
\newif\ifscnu@acaddeg\scnu@acaddegfalse
\DeclareOption{profdeg}{\scnu@profdegtrue}
\DeclareOption{acaddeg}{\scnu@acaddegtrue}
\ProcessOptions\relax

\RequirePackage{amssymb}
\LoadClass[12pt,a4paper,UTF8,twoside]{ctexbook}
\ifscnu@profdeg\relax\else
\ifscnu@acaddeg\relax\else
\ClassError{SCNUThesis}%
{You have to specify one of thesis options: profdeg or acaddeg.}{}
\fi
\fi

\usepackage{setspace}
%%%======================================
%%　　　　　　　　　　　　　页　面　设　置　
%%%======================================
\usepackage[top=2.5cm,bottom=2.5cm,left=2.5cm,right=2.5cm,includehead,includefoot,%
]{geometry}                 % 这是紧凑型.

%用geometry宏包设置页边距
% \usepackage[top=1in,bottom=1in,left=1.25in,right=1.25in]{geometry}
% 上面设置的页边距极不美观，尤其是左右对称的页边距没有考虑装订的需要，
%而且加上页眉后这样的上边距就显得过窄。所以一般需要自己调整一下。

%需要注意的是:
%book类默认是twoside即双面打印模式，与article类默认的 oneside即单面打印模式不同。
%两者区别在于页边距和页码的位置。
%单面模式每页的页边距都相同，双面模式则会在偶数页将设置的左、右页边距调换。
%如果采用单面打印，则可在\documentclass的方括号里加上oneside参数，并在geometry的选项中适当增加左边距，减少右边距，
%以留出装订线的位置。但是不要忘了装订的时候右侧一般会裁掉一点边，所以左、右边距也不要相差过大。如果采用双面打印，
%则geometry中的设置被解释为奇数页的页边距，偶数页的左、右边距会自动互换。
% 还有几个注意事项
% (1) 首先，这里的奇数页和偶数页是针对当前page计数器的值来说的，而不是在生成文件中总的页码。也就是说，假如当前
%     页在整个输出中总排序是偶数页，但当前page计数器(即显示的页码)为奇数，则当前页的页边距是按奇数页设置的。
% (2) \documentclass还有一对选项openright和openany, book类默认是前者，即每一章(包括目录)都会在奇数页开始，如果
%     前一章的最后一页是奇数页，则会在其后插入一页空白页，以确保新的一章仍然从奇数页开始。这是书籍的排版规范，
%     不建议改变。这是双面模式的情况，在单面模式下不存在这个问题。请注意book类默认是双面模式，除非你设为 oneside.
% (3) 为了方便查看，页码应该放在书籍的外侧。对于单面模式，外侧就是右侧，而对于双面模式，奇数页右侧是外侧，偶数页左侧是外侧。
% (4) 关于 PDF 文件打印： 如果用pdf文件来打印，在Acrobat的打印对话框里有一项Page Scaling默认是Fit to paper,
%     这样打印出来整个内容就会缩小一些，不再是设置的尺寸。这是因为打印机的可打印范围不能达到整个A4纸张的全部，
%     而是比A4纸的规格要小一些(具体的可打印范围跟打印机型号有关), Fit to paper 的意思就是把整个页面调整到可打
%     印范围上去，以保证所有页面上的内容都能打印出来。因为可打印范围总是小于A4纸的尺寸，所以打印出来总是会缩小
%     一些。缩小的比例一般为95%左右，与打印机型号有关。解决这个问题，只要选择Page Scaling为None就可以了。

%另一范例
%\usepackage[body={15.5true cm,22true cm},
%            twosideshift=0 pt,
%            headheight=1.5 em]{geometry}    % 版面控制宏包

%%%%%%%%%%%%%%%%%%%%%%%     字 体 设 置     %%%%%%%%%%%%%%%%%

% 重定义字体命令
\newcommand{\song}{\CJKfamily{song}}    % 宋体   (Windows自带simsun.ttf)
\newcommand{\fs}{\CJKfamily{fs}}        % 仿宋体 (华天字库htfs.ttf)
\newcommand{\kai}{\CJKfamily{kai}}      % 楷体   (华天字库htkai.ttf)
\newcommand{\hei}{\CJKfamily{hei}}      % 黑体   (Windows自带simhei.ttf)
\newcommand{\li}{\CJKfamily{li}}        % 隶书   (Windows自带simli.ttf)
\newcommand{\you}{\CJKfamily{you}}      % 幼圆体 (Windows自带simyou.ttf)
%%%  以上六种字体均为标准 GBK 字体, 包括 GBK 繁体字和一些不常用字, 推荐!!!

%\CJKfamily{cy}彩云\CJKfamily{xinwei}新魏\CJKfamily{xingkai}行楷\CJKfamily{yao}姚体\CJKfamily{shu}舒体

%%%%%%%%%%%%%     字 号 设 置     %%%%%%%%

%初号   小初  一号   小一   二号  小二  三号 小三 四号 小四  五号   小五  六号 小六   七号  八号
%42pt  36pt 26pt  24pt  22pt 18pt 16pt 15pt 14pt 12pt 10.5pt  9pt  7.5pt 6.5pt 5.5pt  5pt

\newcommand{\chuhao}{\fontsize{42pt}{\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26pt}{\baselineskip}\selectfont}
\newcommand{\xiaoyihao}{\fontsize{24pt}{\baselineskip}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}{\baselineskip}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}
\newcommand{\xiaoliuhao}{\fontsize{6.5pt}{\baselineskip}\selectfont}
\newcommand{\qihao}{\fontsize{5.5pt}{\baselineskip}\selectfont}
\newcommand{\bahao}{\fontsize{5pt}{\baselineskip}\selectfont}

%强制换行命令
\newcommand{\tabincell}[2]{
  \begin{tabular}{@{}#1@{}}#2
\end{tabular}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%     论 文 封 面     %%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%  中文封面　%%%%%%%%%%%%%%%

\pagestyle{plain}
\thispagestyle{empty}
%\enlargethispage{1cm}

% 封面共用

\def\CAST@nounderline[#1]#2{%
{\hbox to #1{#2\hfill}}}
\def\CASTnounderline{\@ifnextchar[\CAST@nounderline\underline}

  \def\CAST@underline[#1]#2{%
  \underline{\hbox to #1{\hfill#2\hfill}}}
  \def\CASTunderline{\@ifnextchar[\CAST@underline\underline}

    \def\CAST@underlinel[#1]#2{%
    {\hbox to #1{#2\hfill}}}
    \def\CASTunderlinel{\@ifnextchar[\CAST@underlinel\underline}

      \newcommand{\clpage}{%
      \ifscnu@twoside\cleardoublepage\else\clearpage\fi}

      \newcommand\cdotfill{%
      \leavevmode\cleaders\hb@xt@.44em{\hss$\cdot$\hss}\hfill\kern\z@}

      \newcommand\classification[1]{\def\CAST@value@classification{#1}}
      \newcommand\confidential[1]{\def\CAST@value@confidential{#1}}
      \newcommand\UDC[1]{\def\CAST@value@UDC{#1}}
      \newcommand\studentID[1]{\def\CAST@value@studentID{#1}}

      %% 中文标题
      \renewcommand\title[2][\CAST@value@title]{%
        \def\CAST@value@title{#2}
      \def\CAST@value@titlemark{\MakeUppercase{#1}}}
      \newcommand\subtitle[1]{\def\CAST@value@subtitle{#1}}
      %% 英文标题
      \newcommand\etitle[2][\CAST@value@etitle]{%
        \def\CAST@value@etitle{#2}
      \def\CAST@value@etitlemark{\MakeUppercase{#1}}}
      \newcommand\esubtitle[1]{\def\CAST@value@esubtitle{#1}}

      \renewcommand\author[1]{\def\CAST@value@author{#1}}
      \newcommand\eauthor[1]{\def\CAST@value@eauthor{#1}}

      \newcommand\titlefst[1]{\def\CAST@value@titlefst{#1}}
      \newcommand\titlesnd[1]{\def\CAST@value@titlesnd{#1}}

      \newcommand\advisor[1]{\def\CAST@value@advisor{#1}}
      \newcommand\secondadvisor[1]{\def\CAST@value@secondadvisor{#1}}
      \newcommand\eadvisor[1]{\def\CAST@value@eadvisor{#1}}

      \newcommand\ProfessionalTitle[1]{\def\CAST@value@ProfessionalTitle{#1}}

      \newcommand\major[1]{\def\CAST@value@major{#1}}
      \newcommand\emajor[1]{\def\CAST@value@emajor{#1}}
      \newcommand\titleab[1]{\def\CAST@value@titleab{#1}}
      \newcommand\specialization[1]{\def\CAST@value@specialization{#1}}

      \newcommand\especialization[1]{\def\CAST@value@especialization{#1}}
      \newcommand\college[1]{\def\CAST@value@college{#1}}
      \newcommand\ecollege[1]{\def\CAST@value@ecollege{#1}}
      \newcommand\type[1]{\def\CAST@value@type{#1}}

      \newcommand\submityear[1]{\def\CAST@value@submityear{#1}}
      \newcommand\submitmonth[1]{\def\CAST@value@submitmonth{#1}}

      \newcommand\gradyear[1]{\def\CAST@value@gradyear{#1}}
      \newcommand\gradmonth[1]{\def\CAST@value@gradmonth{#1}}

      \newcommand\submitengyear[1]{\def\CAST@value@submitengyear{#1}}
      \newcommand\submitengmonth[1]{\def\CAST@value@submitengmonth{#1}}

      % 中英文摘要
      \newcommand{\scnu@@cabstract}[1]{\long\gdef\scnu@cabstract{#1}}
      \newenvironment{cabstract}{\collect@body\scnu@@cabstract}{}
      \newcommand{\scnu@@eabstract}[1]{\long\gdef\scnu@eabstract{#1}}
      \newenvironment{eabstract}{\collect@body\scnu@@eabstract}{}

      \newcommand{\scnu@@ckeywords}[1]{\long\gdef\scnu@ckeywords{#1}}
      \newenvironment{ckeywords}{\collect@body\scnu@@ckeywords}{}
      \newcommand{\scnu@@ekeywords}[1]{\long\gdef\scnu@ekeywords{#1}}
      \newenvironment{ekeywords}{\collect@body\scnu@@ekeywords}{}

      \usepackage{titlesec}

      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      %%% 生成 学术学位封面    %

      \ifscnu@acaddeg

      \renewcommand\maketitle{%
        \cleardoublepage
        \pagestyle{empty}
        ~~~\vspace{-2.98cm}

        \begin{center}
          \songti\xiaosihao
          \qquad\qquad\quad {}
          \CASTnounderline[90pt]{\CAST@value@classification}
          \hfill
          {}
          \CASTnounderline[120pt]{} %{\CAST@value@confidential}
          \vskip 0pt  \vspace{-4cm}
          \qquad\qquad\quad {} %UDC:~
          \CASTnounderline[90pt]{} %{\CAST@value@UDC}
          \hfill
          {} %学号:~
          \CASTnounderline[120pt]{} %{\CAST@value@studentID}
          \vskip \stretch{2} \vspace{0.38cm}

          \includegraphics[width=150mm]{Style/Figures/SCNULogo-new}    %  fig 表示路径
          \vspace{1.5cm}

          {\heiti\bfseries\xiaochuhao\quad \CAST@value@type~毕~业~论~文（设~计）} %\vspace{0.18cm}

          %{\bfseries\xiaoerhao (~学~术~学~位~)} \vspace{0.68cm}

          \vskip \stretch{1}
%          {
%            \begin{spacing}{1.5}
%              \songti\bf\erhao \CAST@value@title
%          \end{spacing} } % 论文题目
%          \vspace{0.5cm}
          \vskip \stretch{1}
          \heiti
          \def\tabcolsep{1pt}
          \def\arraystretch{1}
          \begin{tabular}{cllllcrl} \vspace{0.12cm}
            %{\sihao \makebox[7em][s]{题\hspace{\fill}目}} &  { : \  } &
            %\multicolumn{4}{l}{\CASTunderline[218pt]{ \sihao\CAST@value@title}}
            %\\
            {\sihao \makebox[7em][s]{论\hspace{\fill}文\hspace{\fill}题\hspace{\fill}目}} &  { : \  } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@titlefst}}
            \\
            {\sihao \makebox[7em][s]{\hspace{\fill}}} &  {} &
            \multicolumn{4}{l}{\CASTunderline[218pt]{ \sihao\CAST@value@titlesnd}}
            \\
            {\sihao \makebox[7em][s]{指\hspace{\fill}导\hspace{\fill}老\hspace{\fill}师}} &  { : \  } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{ \sihao\CAST@value@advisor}}
            \\
            {\sihao  \makebox[7em][s]{学\hspace{\fill}生\hspace{\fill}姓\hspace{\fill}名}}  &   {  : \   } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{ \sihao\CAST@value@author}}
            \\
            {\sihao  \makebox[7em][s]{学\hspace{\fill}号}}&     {  : \  } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@studentID}}
            \\
            {\sihao  \makebox[7em][s]{学\hspace{\fill}院}} &  {  : \   } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@college}}
            \\
            {\sihao \makebox[7em][s]{专\hspace{\fill}业}}&   { : } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@major}}
            \\
            {\sihao \makebox[7em][s]{毕\hspace{\fill}业\hspace{\fill}时\hspace{\fill}间}}&   { : } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao \CAST@value@gradyear\ 年\ \CAST@value@gradmonth\ 月}}
            \\
          \end{tabular}
          \vskip \stretch{1}\vfill
          {\fangsong\sihao{\CAST@value@submityear}\ 年\ \CAST@value@submitmonth\ 月}
        \end{center}
        \cleardoublepage
      }

      \fi

      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
      %%% 生成专业学位封面  %
      \ifscnu@profdeg

      \renewcommand\maketitle{%
        \cleardoublepage
        \pagestyle{empty}
        ~~~\vspace{-2.98cm}

        \begin{center}
          \songti\xiaosihao
          \qquad\qquad\quad 分类号:
          \CASTnounderline[90pt]{\CAST@value@classification}
          \hfill
          密级:~
          \CASTnounderline[120pt]{\CAST@value@confidential}
          \vskip 0pt  \vspace{-0.18cm}
          \qquad\qquad\quad  UDC:~
          \CASTnounderline[90pt]{\CAST@value@UDC}
          \hfill
          学号:~
          \CASTnounderline[120pt]{\CAST@value@studentID}
          \vskip \stretch{2} \vspace{0.38cm}

          \includegraphics[width=88mm]{Style/Figures/1SCNULogo}    %  fig 表示路径
          \vspace{0.98cm}

          {\songti\bfseries\xiaochuhao \CAST@value@type ~学~位~论~文} %\vspace{0.18cm}

          {\bfseries\xiaoerhao (~专~业~学~位~)} \vspace{0.68cm}

          \vskip \stretch{1}
          {
            \begin{spacing}{1.5}
              \songti\bfseries\erhao \CAST@value@title
          \end{spacing} } % 论文题目
          \vspace{0.5cm}
          \vskip \stretch{1}
          \fangsong
          \def\tabcolsep{1pt}
          \def\arraystretch{1}
          \begin{tabular}{cllcrl} \vspace{0.12cm}
            {\sihao \makebox[7em][s]{学\hspace{\fill}位\hspace{\fill}申\hspace{\fill}请\hspace{\fill}人}} &  { : \  } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{ \sihao\CAST@value@author}}
            \\
            {\sihao  \makebox[7em][s]{学\hspace{\fill}科\hspace{\fill}专\hspace{\fill}业}}  &   {  : \   } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{ \sihao\CAST@value@major}}
            \\
            {\sihao  \makebox[7em][s]{论\hspace{\fill}文\hspace{\fill}研\hspace{\fill}究\hspace{\fill}方\hspace{\fill}向}}&     {  : \  } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@specialization}}
            \\
            {\sihao  \makebox[7em][s]{所\hspace{\fill}在\hspace{\fill}学\hspace{\fill}院}} &  {  : \   } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@college}}
            \\
            {\sihao \makebox[7em][s]{导师姓名及职称}}&   { : } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@advisor \  \CAST@value@ProfessionalTitle}}
            \\
            {\sihao \makebox[7em][s]{{\color{white}导师姓名及职称}}}&   {{\color{white} :} } &
            \multicolumn{4}{l}{\CASTunderline[218pt]{\sihao\CAST@value@secondadvisor }}
            \\
          \end{tabular}
          \vskip \stretch{1}\vfill
          {\sihao{\CAST@value@submityear}\ 年\ \CAST@value@submitmonth\ 月}
        \end{center}
        \cleardoublepage
      }

      \fi

      %%%==================
      %%%  生成英文封面
      \newcommand\makeengtitle{%
        \cleardoublepage
        \pagestyle{empty}
        \vspace{0.28cm}

        \begin{center}
          \vskip \stretch{1}
          {
            \begin{spacing}{1.68}
              \songti\bfseries\erhao \CAST@value@etitle\vspace{-0.28cm}
          \end{spacing} } % 论文题目
          \vspace{0.18cm}
          %\vskip \stretch{1}
        \end{center}
      }

      %%%==================
      %%%  答辩合格证明
      \newcommand\passthedefense{%
        \cleardoublepage
        \pagestyle{empty}
        ~~~\vspace{-1.38cm}

        \hspace{-0.68cm}\includegraphics[width=163mm]{Style/Figures/2PasstheDefense}

        \cleardoublepage
      }

      \newcommand\makecabstract{%
        %\addcontentsline{toc}{chapter}{摘要}
        \pagestyle{plain}
        \pagenumbering{Roman}

        \ \vspace{-1.98cm} \
        \begin{center}
          {\bf\xiaoerhao 摘\ 要} %\vspace{-0.38cm}
        \end{center}\vspace{0.68cm}

        \begin{spacing}{1.68}{\xiaosihao\scnu@cabstract}
        \end{spacing}
        \vspace{0.68cm}

        \begin{spacing}{1.68}{\bf\xiaosihao \noindent 关键词:}  {\xiaosihao   \hspace{-0.18cm}\scnu@ckeywords}　
        \end{spacing}
      }

      \newcommand\makeeabstract{%
        \begin{center}
          {\bf\xiaoerhao  ABSTRACT}
        \end{center}

        \begin{spacing}{1.68}{\xiaosihao\scnu@eabstract}
        \end{spacing}
        \vspace{0.68cm}

        \begin{spacing}{1.68}{\bf\xiaosihao \noindent  Keywords:}  {\xiaosihao    \scnu@ekeywords}　
        \end{spacing}
      }

      %%%==================
      %%%  %%% 生成中英文摘要
      \newcommand\makeabstract{%
        \cleardoublepage
        %\addcontentsline{toc}{chapter}{摘要}
        \pagestyle{plain}
        \pagenumbering{Roman}

        \ \vspace{-1.98cm} \
        \begin{center}
          {\bf\xiaoerhao 摘\ 要} %\vspace{-0.38cm}
        \end{center}\vspace{0.68cm}

        \begin{spacing}{1.68}{\xiaosihao\scnu@cabstract}
        \end{spacing}
        \vspace{0.68cm}

        \begin{spacing}{1.68}{\bf\xiaosihao \noindent 关键词:}  {\xiaosihao   \hspace{-0.18cm}\scnu@ckeywords}　
        \end{spacing}

        \newpage
        \cleardoublepage

        %\addcontentsline{toc}{chapter}{ABSTRACT}
        \begin{center}
          {\bf\xiaoerhao  ABSTRACT}
        \end{center}

        \begin{spacing}{1.68}{\xiaosihao\scnu@eabstract}
        \end{spacing}
        \vspace{0.68cm}

        \begin{spacing}{1.68}{\bf\xiaosihao \noindent  Keywords:}  {\xiaosihao    \scnu@ekeywords}　
        \end{spacing}
      }

      %%%==================
      %%%  攻读硕士学位期间取得的研究成果及教学实践成果
      \newcommand\achievement{%
        \cleardoublepage
        \addtocontents{toc}{\vspace{-9pt}}% 在自动生成的目录中减少 9pt的垂直间距
        \addcontentsline{toc}{chapter}{攻读硕士学位期间取得的研究成果及教学实践成果  {\cdotfill}}
        \fancyhead[C]{  }
        ~~~\vspace{-1.28cm}

        \hspace{-0.68cm}\includegraphics[width=160mm]{Style/Figures/3Achievement}

        \cleardoublepage
      }

      %%%==================
      %%%  原创性声明和授权使用声明
      \newcommand\declare{%
        \cleardoublepage
        \addtocontents{toc}{\vspace{-9pt}}% 在自动生成的目录中减少 9pt的垂直间距
        \addcontentsline{toc}{chapter}{华南师范大学学位论文原创性声明 {\cdotfill}}
        \fancyhead[C]{  }

        ~~~\vspace{-1.38cm}

        \hspace{-0.68cm}\includegraphics[width=160mm]{Style/Figures/4declare}

        \cleardoublepage
      }

      %%各级标题的字体设置
      \CTEXsetup[name={},number=\arabic{chapter},beforeskip={-68pt},afterskip={10pt},nameformat={\songti\xiaoerhao\bf\centering},titleformat={\xiaoerhao\bfseries}]{chapter}%章标题格式

      \titleformat{\section}{\centering\xiaosanhao\songti\bfseries}{\thesection}{0.5em}{}

      \CTEXsetup[format={\bfseries\songti\sihao\bf}]{subsection}%小节标题格式

      \titleformat*{\section}{\xiaosanhao\bfseries\vspace{-0.18cm}}
      \titlespacing{\section}{0pt}{0pt}{0pt}
      \titleformat*{\subsection}{\sihao\bfseries\vspace{-0.18cm}}
      \titlespacing{\subsection}{0pt}{0pt}{0pt}

      %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

      \newcommand{\titleinheader}{\CAST@value@titleab}

      \usepackage{titletoc}
      \renewcommand\contentsname{\xiaoerhao\bfseries 目\hspace{0.5em}录}
      % 调整目录行间距（注意：这不是直接的行间距控制，而是通过影响字体大小来间接实现的）
      %\dottedcontents{chapter}[2.5em]{}{2pc}{0.5pc}
      \dottedcontents{section}[2.5em]{}{2pc}{0.5pc}
      \dottedcontents{subsection}[3.5em]{}{2.5pc}{0.5pc} % 调整section级别的目录项格式，间接影响“行间距”感知
      % 其中[0em]是缩进，[2.3em]是标签（通常是数字和点）和条目标题之间的间距，1.5pc是条目标题之间的垂直距离，2pc是段落之间的额外空间。

      \endinput
      %%
      %% End of file `SCNUthesis.cls'.
