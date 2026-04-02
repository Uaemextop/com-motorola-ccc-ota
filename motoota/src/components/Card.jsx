import { cn } from '@/lib/cn';
import { motion } from 'framer-motion';

export default function Card({ children, className, animate = true, ...props }) {
  const Wrapper = animate ? motion.div : 'div';
  return (
    <Wrapper
      className={cn(
        'bg-[#1a2235] border border-[#2a3450] rounded-xl p-6',
        'hover:border-[#00d4ff]/40 transition-colors duration-300',
        className
      )}
      {...(animate ? { initial: { opacity: 0, y: 20 }, animate: { opacity: 1, y: 0 }, transition: { duration: 0.4 } } : {})}
      {...props}
    >
      {children}
    </Wrapper>
  );
}
