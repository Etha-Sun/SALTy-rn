#include <sys/ptrace.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <sys/user.h>
#include <unistd.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
int main(int argc,char **argv){
 if(argc<2)return 2;
 pid_t p=fork();
 if(p==0){if(ptrace(PTRACE_TRACEME,0,0,0)==-1){perror("ptrace");exit(2);}execv(argv[1],argv+1);perror("execv");exit(2);}
 int s;waitpid(p,&s,0);if(WIFEXITED(s))return WEXITSTATUS(s);
 ptrace(PTRACE_CONT,p,0,0);
 while(waitpid(p,&s,0)>0){
  if(WIFEXITED(s))return WEXITSTATUS(s);
  if(WIFSIGNALED(s))return 128+WTERMSIG(s);
  if(WIFSTOPPED(s)){
   int sig=WSTOPSIG(s);
   if(sig==SIGSEGV){struct user_regs_struct r;ptrace(PTRACE_GETREGS,p,0,&r);fprintf(stderr,"SIGSEGV RIP=%llx RAX=%llx RDI=%llx RSI=%llx RBP=%llx RSP=%llx\n",r.rip,r.rax,r.rdi,r.rsi,r.rbp,r.rsp);for(int i=0;i<5;i++){long a=ptrace(PTRACE_PEEKDATA,p,(void*)(r.rdi+8*i),0);fprintf(stderr,"RDI+%d=%lx\n",8*i,a);}ptrace(PTRACE_KILL,p,0,0);waitpid(p,&s,0);return 139;}
   ptrace(PTRACE_CONT,p,0,sig==SIGTRAP?0:sig);
  }
 }
 return 2;
}
